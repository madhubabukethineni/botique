variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "description" {
  type        = string
  default     = null
}

variable "auto_create_subnetworks" {
  type        = bool
  default     = false
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  validation {
    condition     = contains(["GLOBAL", "REGIONAL"], var.routing_mode)
    error_message = "routing_mode must be GLOBAL or REGIONAL"
  }
}

variable "delete_default_internet_gateway_routes" {
  type        = bool
  default     = false
}

variable "mtu" {
  type        = number
  default     = 1460
}

variable "enable_ipv6_ula" {
  type        = bool
  default     = false
}

variable "internal_ipv6_range" {
  type        = string
  default     = null
}

variable "network_firewall_policy_enforcement_order" {
  type        = string
  default     = null
  description = "Controls firewall policy evaluation order"
}

variable "network_profile" {
  type        = string
  default     = null
}

variable "bgp_best_path_selection_mode" {
  type        = string
  default     = "LEGACY"
  validation {
    condition     = contains(["LEGACY", "STANDARD"], var.bgp_best_path_selection_mode)
    error_message = "bgp_best_path_selection_mode must be LEGACY or STANDARD"
  }
}

variable "bgp_always_compare_med" {
  type        = bool
  default     = false
}

variable "bgp_inter_region_cost" {
  type        = bool
  default     = false
}
