variable "name" {
  description = "GKE cluster name"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "location" {
  description = "Cluster region or zone"
  type        = string
}

variable "network" {
  description = "VPC network ID or self_link"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork ID or self_link"
  type        = string
}

# -------------------------
# Autopilot vs Standard
# -------------------------
variable "enable_autopilot" {
  type        = optional(bool)
  description = "Enable Autopilot mode for this cluster"
  default     = false
}

# -------------------------
# Standard cluster configs
# -------------------------
variable "release_channel" {
  type        = optional(string)
  description = "Release channel for cluster"
  default     = null
}

variable "ip_allocation_policy" {
  description = "IP allocation policy for VPC-native clusters"
  type = optional(object({
    cluster_secondary_range_name  = optional(string)
    services_secondary_range_name = optional(string)
    use_ip_aliases                = optional(bool)
  }))
  default = null
}

variable "private_cluster_config" {
  type = optional(object({
    enable_private_nodes    = optional(bool)
    enable_private_endpoint = optional(bool)
    master_ipv4_cidr_block  = optional(string)
  }))
  description = "Config for private GKE clusters"
  default     = null
}

variable "master_authorized_networks" {
  description = "Master authorized networks"
  type = optional(list(object({
    cidr_block   = string
    display_name = string
  })))
  default = null
}

variable "workload_identity" {
  type        = optional(bool)
  description = "Enable workload identity"
  default     = false
}

variable "addons_config" {
  description = "Additional GKE addons"
  type = optional(object({
    http_load_balancing          = optional(bool)
    horizontal_pod_autoscaling   = optional(bool)
    kubernetes_dashboard         = optional(bool)
    network_policy_config        = optional(bool)
  }))
  default = null
}

variable "network_policy_config" {
  description = "Network policy config block"
  type = optional(object({
    disabled = optional(bool)
  }))
  default = null
}

variable "logging_components" {
  description = "Enable logging components"
  type        = optional(list(string))
  default     = null
}

variable "monitoring_components" {
  description = "Enable monitoring components"
  type        = optional(list(string))
  default     = null
}

variable "node_pools" {
  description = "Node pool definitions (standard clusters only)"
  type = optional(map(object({
    machine_type = optional(string)
    disk_size_gb = optional(number)
    min_count    = optional(number)
    max_count    = optional(number)
    auto_upgrade = optional(bool)
    auto_repair  = optional(bool)
    preemptible  = optional(bool)
  })))
  default = {}
}
