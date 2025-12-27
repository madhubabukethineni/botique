variable "name" { 
  type        = string
  description = "Name of the GKE cluster (lowercase, hyphens only)"
}

variable "project_id" { 
  type        = string
  description = "GCP project ID"
}

variable "location" { 
  type        = string
  description = "Region or zone for the cluster"
}

variable "network" { 
  type        = string
  description = "VPC network name or self_link"
}

variable "subnetwork" { 
  type        = string
  description = "Subnetwork name or self_link"
}

variable "enable_autopilot" { 
  type        = bool
  description = "Enable Autopilot mode for the cluster"
  default     = false
}

variable "release_channel" { 
  type        = string
  description = "GKE release channel (REGULAR, RAPID, STABLE)"
  default     = null
}

variable "ip_allocation_policy" {
  type = object({
    cluster_secondary_range_name  = string
    services_secondary_range_name = string
  })
  description = "IP allocation policy for VPC-native clusters"
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
  type    = list(any)
  default = []
}

variable "workload_identity" {
  type    = bool
  default = false
}

variable "addons_config" {
  type = object({
    http_load_balancing        = bool
    horizontal_pod_autoscaling = bool
  })
  description = "GKE addons configuration"
  default = null
}

variable "network_policy_config" {
  type = object({
    enabled  = bool
    provider = string
  })
  description = "Network policy configuration (only for Standard clusters)"
  default = null
}

variable "logging_components" { 
  type        = list(string)
  description = "Logging components to enable"
  default     = ["SYSTEM_COMPONENTS"]
}

variable "monitoring_components" { 
  type        = list(string)
  description = "Monitoring components to enable"
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
    auto_upgrade = optional(bool, false)
    auto_repair  = optional(bool, false)
  }))
  description = "Node pools for Standard clusters (ignored in Autopilot)"
  default = {}
}
