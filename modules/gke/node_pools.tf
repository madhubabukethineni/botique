# Only applies if not Autopilot
resource "google_container_node_pool" "pools" {
  for_each = var.enable_autopilot ? {} : var.node_pools

  name    = each.value.name
  cluster = google_container_cluster.this.name
  project = var.project_id
  location = var.location

  autoscaling {
    min_node_count = each.value.min_count
    max_node_count = each.value.max_count
  }

  management {
    auto_upgrade = lookup(each.value, "auto_upgrade", false)
    auto_repair  = lookup(each.value, "auto_repair", false)
  }

  node_config {
    machine_type = each.value.machine_type
    disk_size_gb = each.value.disk_size_gb
    preemptible  = lookup(each.value, "preemptible", false)

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
