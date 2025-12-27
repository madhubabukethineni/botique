variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "project_id" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "enable_autopilot" {
  type = bool
}

variable "release_channel" {
  type    = string
  default = null
}

variable "ip_allocation_policy" {
  type    = any
  default = null
}

variable "private_cluster_config" {
  type    = any
  default = null
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
  type    = any
  default = null
}

variable "network_policy_config" {
  type    = any
  default = null
}

variable "logging_components" {
  type    = list(string)
  default = ["SYSTEM_COMPONENTS"]
}

variable "monitoring_components" {
  type    = list(string)
  default = ["SYSTEM_COMPONENTS"]
}

variable "node_pools" {
  type    = any
  default = {}
}