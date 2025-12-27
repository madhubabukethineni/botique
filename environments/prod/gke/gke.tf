# module "gke" {
#   source   = "../../../modules/gke"
#   for_each = var.gke_clusters

#   name               = each.key
#   project_id         = each.value.project_id
#   location           = each.value.location
#   network            = each.value.network
#   subnetwork         = each.value.subnetwork
#   enable_autopilot   = each.value.enable_autopilot

#   release_channel            = each.value.release_channel
#   ip_allocation_policy       = each.value.ip_allocation_policy
#   private_cluster_config     = each.value.private_cluster_config
#   master_authorized_networks = each.value.master_authorized_networks
#   workload_identity          = each.value.workload_identity
#   addons_config              = each.value.addons_config
#   network_policy_config      = each.value.network_policy_config
#   logging_components         = each.value.logging_components
#   monitoring_components      = each.value.monitoring_components
#   node_pools                 = each.value.node_pools
# }




terraform {
  backend "gcs" {}
}

module "gke" {
  source   = "../../../modules/gke"
  for_each = var.gke_clusters

  name             = each.key
  project_id       = each.value.project_id
  location         = each.value.location
  network          = each.value.network
  subnetwork       = each.value.subnetwork
  enable_autopilot = each.value.enable_autopilot

  # Safely handle optional fields from the 'any' map
  release_channel            = try(each.value.release_channel, null)
  ip_allocation_policy       = try(each.value.ip_allocation_policy, null)
  private_cluster_config     = try(each.value.private_cluster_config, null)
  master_authorized_networks = try(each.value.master_authorized_networks, [])
  workload_identity          = try(each.value.workload_identity, false)
  addons_config              = try(each.value.addons_config, null)
  network_policy_config      = try(each.value.network_policy_config, null)
  logging_components         = try(each.value.logging_components, ["SYSTEM_COMPONENTS"])
  monitoring_components      = try(each.value.monitoring_components, ["SYSTEM_COMPONENTS"])
  node_pools                 = try(each.value.node_pools, {})
}