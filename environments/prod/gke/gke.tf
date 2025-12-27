module "gke" {
  source   = "../../../modules/gke"
  for_each = var.gke_clusters

  name                   = each.key
  project_id             = each.value.project_id
  location               = each.value.location
  network                = each.value.network
  subnetwork             = each.value.subnetwork

  enable_autopilot       = lookup(each.value, "enable_autopilot", false)
  release_channel        = lookup(each.value, "release_channel", null)
  ip_allocation_policy   = lookup(each.value, "ip_allocation_policy", null)
  private_cluster_config = lookup(each.value, "private_cluster_config", null)
  master_authorized_networks = lookup(each.value, "master_authorized_networks", [])
  workload_identity      = lookup(each.value, "workload_identity", true)
  logging_components     = lookup(each.value, "logging_components", ["SYSTEM_COMPONENTS"])
  monitoring_components  = lookup(each.value, "monitoring_components", ["SYSTEM_COMPONENTS"])
  addons_config          = lookup(each.value, "addons_config", null)
  network_policy_config  = lookup(each.value, "network_policy_config", null)
  node_pools             = lookup(each.value, "node_pools", {})
}
