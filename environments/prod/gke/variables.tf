# variable "gke_clusters" {
#   type = map(object({
#     project_id                 = string
#     location                   = string
#     network                    = string
#     subnetwork                 = string
#     enable_autopilot           = bool
#     release_channel            = optional(string)
#     ip_allocation_policy       = optional(any)
#     private_cluster_config     = optional(any)
#     master_authorized_networks = optional(list(any), [])
#     workload_identity          = optional(bool, false)
#     addons_config              = optional(any)
#     network_policy_config      = optional(any)
#     logging_components         = optional(list(string), ["SYSTEM_COMPONENTS"])
#     monitoring_components      = optional(list(string), ["SYSTEM_COMPONENTS"])
#     node_pools                 = optional(any, {})
#   }))
# }


variable "gke_clusters" {
  type = any
  description = "Map of GKE cluster configurations"
}