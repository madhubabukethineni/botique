variable "gke_clusters" {
  description = "Map of GKE clusters"
  type = map(object({
    project_id        = string
    location          = string
    network           = string
    subnetwork        = string

    enable_autopilot  = optional(bool)
    release_channel   = optional(string)

    ip_allocation_policy = optional(object({
      cluster_secondary_range_name  = optional(string)
      services_secondary_range_name = optional(string)
      use_ip_aliases                = optional(bool)
    }))

    private_cluster_config = optional(object({
      enable_private_nodes    = optional(bool)
      enable_private_endpoint = optional(bool)
      master_ipv4_cidr_block  = optional(string)
    }))

    master_authorized_networks = optional(list(object({
      cidr_block   = string
      display_name = string
    })))

    workload_identity     = optional(bool)
    logging_components    = optional(list(string))
    monitoring_components = optional(list(string))

    addons_config = optional(object({
      http_load_balancing        = optional(bool)
      horizontal_pod_autoscaling = optional(bool)
      kubernetes_dashboard       = optional(bool)
      network_policy_config      = optional(bool)
    }))

    node_pools = optional(map(object({
      machine_type = optional(string)
      disk_size_gb = optional(number)
      min_count    = optional(number)
      max_count    = optional(number)
      auto_upgrade = optional(bool)
      auto_repair  = optional(bool)
      preemptible  = optional(bool)
    })))
  }))
}
