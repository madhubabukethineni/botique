resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.region

  network    = var.network_self_link
  subnetwork = var.subnet_self_link

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range
    services_secondary_range_name = var.services_secondary_range
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  logging_service    = var.logging_service
  monitoring_service = var.monitoring_service

  dynamic "release_channel" {
    for_each = var.release_channel == "" ? [] : [var.release_channel]
    content { channel = release_channel.value }
  }
}
