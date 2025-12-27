resource "google_container_cluster" "this" {
  name     = var.name
  location = var.location
  project  = var.project_id

  network    = var.network
  subnetwork = var.subnetwork

  enable_autopilot = var.enable_autopilot

  dynamic "release_channel" {
    for_each = var.release_channel != null ? [1] : []
    content {
      channel = var.release_channel
    }
  }

  dynamic "ip_allocation_policy" {
    for_each = var.ip_allocation_policy != null ? [var.ip_allocation_policy] : []
    content {
      cluster_secondary_range_name  = ip_allocation_policy.value.cluster_secondary_range_name
      services_secondary_range_name = ip_allocation_policy.value.services_secondary_range_name
    }
  }

  dynamic "private_cluster_config" {
    for_each = var.private_cluster_config != null ? [var.private_cluster_config] : []
    content {
      enable_private_nodes    = private_cluster_config.value.enable_private_nodes
      enable_private_endpoint = private_cluster_config.value.enable_private_endpoint
      master_ipv4_cidr_block  = private_cluster_config.value.master_ipv4_cidr_block
    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = length(coalesce(var.master_authorized_networks, [])) > 0 ? [1] : []
    content {
      dynamic "cidr_blocks" {
        for_each = var.master_authorized_networks
        content {
          cidr_block   = cidr_blocks.value.cidr_block
          display_name = cidr_blocks.value.display_name
        }
      }
    }
  }

  dynamic "addons_config" {
    for_each = var.addons_config != null ? [var.addons_config] : []
    content {
      http_load_balancing {
        disabled = !addons_config.value.http_load_balancing
      }
      horizontal_pod_autoscaling {
        disabled = !addons_config.value.horizontal_pod_autoscaling
      }
    }
  }

  # FIX: Block MUST be omitted for Autopilot clusters
  dynamic "network_policy" {
    for_each = (var.enable_autopilot == false && var.network_policy_config != null) ? [1] : []
    content {
      enabled  = var.network_policy_config.enabled
      provider = var.network_policy_config.provider
    }
  }

  logging_config {
    enable_components = length(coalesce(var.logging_components, [])) > 0 ? var.logging_components : ["SYSTEM_COMPONENTS"]
  }

  monitoring_config {
    enable_components = length(coalesce(var.monitoring_components, [])) > 0 ? var.monitoring_components : ["SYSTEM_COMPONENTS"]
  }

  workload_identity_config {
    workload_pool = var.workload_identity == true ? "${var.project_id}.svc.id.goog" : null
  }

  # FIX: Block MUST be omitted for Autopilot clusters
  dynamic "node_pool" {
    for_each = var.enable_autopilot ? {} : coalesce(var.node_pools, {})
    content {
      name               = node_pool.value.name
      initial_node_count = node_pool.value.min_count
      autoscaling {
        min_node_count = node_pool.value.min_count
        max_node_count = node_pool.value.max_count
      }
      node_config {
        machine_type = node_pool.value.machine_type
        disk_size_gb = node_pool.value.disk_size_gb
        preemptible  = try(node_pool.value.preemptible, false)
      }
    }
  }
}