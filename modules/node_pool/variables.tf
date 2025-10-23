variable "project_id" {
  description = "The ID of the GCP project where the GKE cluster and node pools will be created."
  type        = string
}

variable "region" {
  description = "The region in which the GKE cluster will be deployed."
  type        = string
}

variable "cluster_name" {
  description = "The name of the existing GKE cluster to which node pools will be attached."
  type        = string
}

variable "node_pools" {
  description = "List of node pool configurations for the GKE cluster."
  type = list(object({
    name         = string
    machine_type = string
    node_count   = number
    preemptible  = optional(bool, false)
    min_count    = optional(number)
    max_count    = optional(number)
    taints       = optional(list(object({
      key    = string
      value  = string
      effect = string
    })), [])
    labels       = optional(map(string), {})
    oauth_scopes = optional(list(string), ["https://www.googleapis.com/auth/cloud-platform"])
  }))
  default = []
}

