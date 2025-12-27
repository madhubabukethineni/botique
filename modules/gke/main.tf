resource "google_container_cluster" "this" {
  name     = var.name
  project  = var.project_id
  location = var.location

  network    = var.network
  subnetwork = var.subnetwork

  # -----------------------------
  # Autopilot block
  # -----------------------------
  dynamic "autopilot" {
    for_each = var.enable_autopilot ? [1] : []
    content {
      enabled = true
    }
  }

  # -----------------------------
  # IP Allocation
  # -----------------------------
  dynamic "ip_allocation_policy" {
    for_each = var.ip_allocation_policy == null ? [] : [var.ip_allocation_policy]
    content {
      cluster_secondary_range_name  = ip_allocation_policy.value.cluster_secondary_range_name
      services_secondary_range_name = ip_allocation_policy.value.services_secondary_range_name
      use_ip_aliases                = ip_allocation_policy.value.use_ip_aliases
    }
  }

  # -----------------------------
  # Private cluster config
  # -----------------------------
  dynamic "private_cluster_config" {
    for_each = var.private_cluster_config == null ? [] : [var.private_cluster_config]
    content {
      enable_private_nodes    = private_cluster_config.value.enable_private_nodes
      enable_private_endpoint = private_cluster_config.value.enable_private_endpoint
      master_ipv4_cidr_block  = private_cluster_config.value.master_ipv4_cidr_block
    }
  }

  # -----------------------------
  # Master authorized networks
  # -----------------------------
  dynamic "master_authorized_networks_config" {
    for_each = var.master_authorized_networks == null ? [] : [var.master_authorized_networks]
    content {
      dynamic "cidr_blocks" {
        for_each = master_authorized_networks.value
        content {
          cidr_block   = cidr_blocks.value.cidr_block
          display_name = cidr_blocks.value.display_name
        }
      }
    }
  }

  # -----------------------------
  # Workload identity
  # -----------------------------
  dynamic "workload_identity_config" {
    for_each = var.workload_identity ? [1] : []
    content {
      workload_pool = "${var.project_id}.svc.id.goog"
    }
  }

  # -----------------------------
  # Logging
  # -----------------------------
  dynamic "logging_config" {
    for_each = var.logging_components == null ? [] : [1]
    content {
      enable_components = var.logging_components
    }
  }

  # -----------------------------
  # Monitoring
  # -----------------------------
  dynamic "monitoring_config" {
    for_each = var.monitoring_components == null ? [] : [1]
    content {
      enable_components = var.monitoring_components
    }
  }

  # -----------------------------
  # Addons
  # -----------------------------
  dynamic "addons_config" {
    for_each = var.addons_config == null ? [] : [var.addons_config]
    content {
      http_load_balancing {
        disabled = !addons_config.value.http_load_balancing
      }
      horizontal_pod_autoscaling {
        disabled = !addons_config.value.horizontal_pod_autoscaling
      }
      kubernetes_dashboard {
        disabled = !addons_config.value.kubernetes_dashboard
      }
      network_policy_config {
        disabled = !addons_config.value.network_policy_config
      }
    }
  }
}
