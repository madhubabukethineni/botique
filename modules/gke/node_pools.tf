# Only applies if not Autopilot
resource "google_container_node_pool" "pools" {
  count = var.enable_autopilot ? 0 : length(var.node_pools)

  name     = keys(var.node_pools)[count.index]
  cluster  = google_container_cluster.this.name
  project  = var.project_id
  location = var.location

  autoscaling {
    min_node_count = lookup(values(var.node_pools)[count.index], "min_count", null)
    max_node_count = lookup(values(var.node_pools)[count.index], "max_count", null)
  }

  management {
    auto_upgrade = lookup(values(var.node_pools)[count.index], "auto_upgrade", false)
    auto_repair  = lookup(values(var.node_pools)[count.index], "auto_repair", false)
  }

  node_config {
    machine_type = lookup(values(var.node_pools)[count.index], "machine_type", null)
    disk_size_gb = lookup(values(var.node_pools)[count.index], "disk_size_gb", null)
    preemptible  = lookup(values(var.node_pools)[count.index], "preemptible", false)

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
