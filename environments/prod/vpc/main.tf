terraform {
  backend "gcs" {}
}

module "vpc" {
  source   = "./modules/vpc"
  for_each = local.vpcs_expanded

  project_id   = each.value.project_id
  network_name = each.value.network_name

  description                               = each.value.description
  auto_create_subnetworks                   = each.value.auto_create_subnetworks
  routing_mode                              = each.value.routing_mode
  delete_default_internet_gateway_routes    = each.value.delete_default_internet_gateway_routes
  mtu                                       = each.value.mtu
  enable_ipv6_ula                           = each.value.enable_ipv6_ula
  internal_ipv6_range                       = each.value.internal_ipv6_range
  network_firewall_policy_enforcement_order = each.value.network_firewall_policy_enforcement_order
  network_profile                           = each.value.network_profile

  bgp_best_path_selection_mode = each.value.bgp_best_path_selection_mode
  bgp_always_compare_med       = each.value.bgp_always_compare_med
  bgp_inter_region_cost        = each.value.bgp_inter_region_cost
}
