resource "google_container_node_pool" "pools" {
  for_each = { for np in var.node_pools : np.name => np }

  name     = each.value.name
  project  = var.project_id
  cluster  = var.cluster_name
  location = var.region

  node_count = each.value.node_count

  node_config {
    machine_type = each.value.machine_type
    preemptible  = lookup(each.value, "preemptible", false)

    oauth_scopes = lookup(each.value, "oauth_scopes", ["https://www.googleapis.com/auth/cloud-platform"])

    dynamic "taint" {
      for_each = lookup(each.value, "taints", [])
      content {
        key = taint.value.key
        value = taint.value.value
        effect = taint.value.effect
      }
    }

    labels = lookup(each.value, "labels", null)
  }

  autoscaling {
    min_node_count = lookup(each.value, "min_count", each.value.node_count)
    max_node_count = lookup(each.value, "max_count", each.value.node_count)
  }
}
