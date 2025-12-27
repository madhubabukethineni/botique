vpcs = {
  prod = {
    # --------------------
    # Required
    # --------------------
    project_id   = "k8s-prep-433307"
    network_name = "prod-vpc"

    # --------------------
    # Core VPC
    # --------------------
    description                            = "Production VPC network"
    auto_create_subnetworks                = false
    routing_mode                           = "GLOBAL"
    delete_default_internet_gateway_routes = true
    mtu                                    = 1460

    # --------------------
    # IPv6 (ULA)
    # --------------------
    enable_ipv6_ula     = true
    internal_ipv6_range = "fd20:1234:abcd::/48"

    # --------------------
    # Firewall / Profile
    # --------------------
    network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
    network_profile                           = null

    # --------------------
    # BGP
    # --------------------
    bgp_best_path_selection_mode = "STANDARD"
    bgp_always_compare_med       = true
    bgp_inter_region_cost        = "ADD_COST_TO_MED"
  },

  # --------------------
  # NON-PROD (minimal)
  # --------------------
  nonprod = {
    project_id   = "k8s-prep-433307"
    network_name = "nonprod-vpc"
    routing_mode = "REGIONAL"
  }

}