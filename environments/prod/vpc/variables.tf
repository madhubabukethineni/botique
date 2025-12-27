variable "vpcs" {
  description = "Map of VPC configurations"
  type = map(object({
    # --------------------
    # Required
    # --------------------
    project_id   = string
    network_name = string

    # --------------------
    # Core VPC settings
    # --------------------
    description                               = optional(string, null)
    auto_create_subnetworks                   = optional(bool, false)
    routing_mode                              = optional(string, "GLOBAL")
    delete_default_internet_gateway_routes    = optional(bool, false)
    mtu                                       = optional(number, 1460)

    # --------------------
    # IPv6 (ULA)
    # --------------------
    enable_ipv6_ula     = optional(bool, false)
    internal_ipv6_range = optional(string, null)

    # --------------------
    # Firewall / profile
    # --------------------
    network_firewall_policy_enforcement_order = optional(string, null)
    network_profile                           = optional(string, null)

    # --------------------
    # BGP
    # --------------------
    bgp_best_path_selection_mode = optional(string, "LEGACY")
    bgp_always_compare_med       = optional(bool, false)
    bgp_inter_region_cost        = optional(string, "DEFAULT")


  }))
}