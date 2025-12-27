variable "name" {
  type        = string
  description = "Name of the subnetwork"
}

variable "ip_cidr_range" {
  type        = string
  description = "Primary CIDR range for the subnetwork"
}

variable "network_name" {
  type        = string
  description = "VPC network resource link or name"
}

variable "region" {
  type        = string
  description = "Region where the subnetwork will be created"
}

variable "project_id" {
  type        = string
  description = "Project ID where the subnetwork will be created"
  default     = null
}

variable "description" {
  type        = string
  description = "Optional description of the subnetwork"
  default     = null
}


variable "private_ip_google_access" {
  type        = bool
  description = "Whether VMs without external IPs can reach Google APIs privately"
  default     = false
}

variable "log_config" {
  description = "VPC Flow Logs configuration for the subnetwork"
  type = object({
    aggregation_interval = optional(string, "INTERVAL_5_SEC")
    flow_sampling        = optional(number, 0.5)
    metadata             = optional(string, "INCLUDE_ALL_METADATA")
    metadata_fields      = optional(list(string))
  })
  default = null
}

variable "secondary_ip_ranges" {
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
  description = "List of secondary IP ranges for alias IPs (e.g., GKE pods/services)"
  default     = []
}
