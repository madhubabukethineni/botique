
variable "gke_clusters" {
  type = map(object({
    project_id                 = string
    location                   = string
    network                    = string
    subnetwork                 = string
    enable_autopilot            = bool
    release_channel            = optional(string)
    ip_allocation_policy       = optional(object({
      cluster_secondary_range_name  = string
      services_secondary_range_name = string
    }))
    private_cluster_config      = optional(object({
      enable_private_nodes    = bool
      enable_private_endpoint = bool
      master_ipv4_cidr_block  = string
    }))
    master_authorized_networks = optional(list(object({ cidr_block = string, display_name = string })))
    workload_identity           = optional(bool)
    addons_config               = optional(object({
      http_load_balancing        = bool
      horizontal_pod_autoscaling = bool
    }))
    network_policy_config       = optional(object({ enabled = bool, provider = string }))
    logging_components          = optional(list(string))
    monitoring_components       = optional(list(string))
    node_pools                  = optional(map(object({
      name         = string
      machine_type = string
      min_count    = number
      max_count    = number
      disk_size_gb = number
      preemptible  = optional(bool)
      auto_upgrade = optional(bool)
      auto_repair  = optional(bool)
    })))
  }))
}
