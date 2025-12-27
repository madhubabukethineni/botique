variable "name" {
  type        = string
  description = "Name of the GKE cluster (lowercase letters, numbers, and hyphens only)"
}

variable "project_id" {
  type        = string
  description = "GCP project ID where the cluster will be created"
}

variable "location" {
  type        = string
  description = "Region or zone for the GKE cluster"
}

variable "network" {
  type        = string
  description = "VPC network name where the cluster will be deployed"
}

variable "subnetwork" {
  type        = string
  description = "Subnet name where the cluster will be deployed"
}

variable "enable_autopilot" {
  type        = bool
  description = "Enable Autopilot mode for this cluster"
  default     = false
}

variable "release_channel" {
  type        = string
  description = "Release channel for the cluster (STABLE, REGULAR, RAPID)"
  default     = null
}

variable "ip_allocation_policy" {
  type = object({
    cluster_secondary_range_name  = string
    services_secondary_range_name = string
  })
  description = "IP allocation policy for secondary ranges"
  default     = null
}

variable "private_cluster_config" {
  type = object({
    enable_private_nodes    = bool
    enable_private_endpoint = bool
    master_ipv4_cidr_block  = string
  })
  description = "Private cluster configuration"
  default     = null
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of CIDR blocks allowed to access master"
  default     = []
}

variable "workload_identity" {
  type        = bool
  description = "Enable workload identity"
  default     = true
}

variable "addons_config" {
  type = object({
    http_load_balancing        = bool
    horizontal_pod_autoscaling = bool
  })
  description = "Addons configuration for GKE cluster"
  default     = null
}

variable "network_policy_config" {
  type = object({
    enabled  = bool
    provider = string
  })
  description = "Network policy configuration"
  default     = null
}

variable "logging_components" {
  type        = list(string)
  description = "GKE cluster logging components"
  default     = ["SYSTEM_COMPONENTS"]
}

variable "monitoring_components" {
  type        = list(string)
  description = "GKE cluster monitoring components"
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
  description = "Node pool configuration (ignored if Autopilot is enabled)"
  default     = {}
}
