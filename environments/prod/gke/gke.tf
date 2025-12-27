module "gke" {
  source   = "../../../modules/gke"
  for_each = var.gke_clusters

  name                   = each.key
  project_id             = each.value.project_id
  location               = each.value.location
  network                = each.value.network
  subnetwork             = each.value.subnetwork

  enable_autopilot       = each.value.enable_autopilot
  release_channel        = each.value.release_channel
  ip_allocation_policy   = each.value.ip_allocation_policy
  private_cluster_config = each.value.private_cluster_config
  master_authorized_networks = each.value.master_authorized_networks

  workload_identity      = each.value.workload_identity
  logging_components     = each.value.logging_components
  monitoring_components  = each.value.monitoring_components
  addons_config          = each.value.addons_config

  node_pools             = each.value.node_pools
}
