variable "name" {
  type        = string
  description = "Name of the GKE cluster"
}

variable "project_id" {
  type        = string
  description = "GCP project ID where the cluster will be created"
}

variable "location" {
  type        = string
  description = "Region or zone for the cluster"
}

variable "network" {
  type        = string
  description = "VPC network name or self_link where cluster will be deployed"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork name or self_link where cluster nodes will be deployed"
}

variable "enable_autopilot" {
  type        = bool
  description = "Whether to enable Autopilot mode for the cluster"
  default     = false
}

variable "release_channel" {
  type        = string
  description = "Release channel for the cluster (e.g., REGULAR, RAPID, STABLE)"
  default     = null
}

variable "ip_allocation_policy" {
  type = object({
    cluster_secondary_range_name  = string
    services_secondary_range_name = string
  })
  description = "IP allocation policy defining secondary ranges for pods and services"
  default     = null
}

variable "private_cluster_config" {
  type = object({
    enable_private_nodes    = bool
    enable_private_endpoint = bool
    master_ipv4_cidr_block  = string
  })
  description = "Private cluster configuration including master CIDR and private nodes"
  default     = null
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of CIDR blocks allowed to access the master endpoint"
  default     = []
}

variable "workload_identity" {
  type        = bool
  description = "Whether to enable workload identity for the cluster"
  default     = true
}

variable "addons_config" {
  type = object({
    http_load_balancing        = bool
    horizontal_pod_autoscaling = bool
  })
  description = "Addons configuration for the cluster"
  default     = null
}

variable "network_policy_config" {
  type = object({
    enabled  = bool
    provider = string
  })
  description = "Network policy configuration (e.g., CALICO provider)"
  default     = null
}

variable "logging_components" {
  type        = list(string)
  description = "Logging components to enable in the cluster"
  default     = ["SYSTEM_COMPONENTS"]
}

variable "monitoring_components" {
  type        = list(string)
  description = "Monitoring components to enable in the cluster"
  default     = ["SYSTEM_COMPONENTS"]
}

variable "node_pools" {
  type = map(object({
    name         = string
    machine_type = string
    min_count    = number
    max_count    = number
    disk_size_gb = number
    preemptible  = optional(bool, false)
  }))
  description = "Map of node pools to create for the cluster"
  default     = {}
}
