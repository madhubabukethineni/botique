variable "name" {
  type        = string
  description = "Name of the subnetwork"
}

variable "ip_cidr_range" {
  type        = string
  description = "Primary CIDR range for the subnetwork"
}

variable "network" {
  type        = string
  description = "VPC network resource link or name"
}

variable "region" {
  type        = string
  description = "Region where the subnetwork will be created"
}

variable "project" {
  type        = string
  description = "Project ID where the subnetwork will be created"
  default     = null
}

variable "description" {
  type        = string
  description = "Optional description of the subnetwork"
  default     = null
}

variable "enable_flow_logs" {
  type        = bool
  description = "Whether to enable VPC Flow Logs for this subnetwork"
  default     = false
}

variable "private_ip_google_access" {
  type        = bool
  description = "Whether VMs without external IPs can reach Google APIs privately"
  default     = false
}

variable "secondary_ip_ranges" {
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
  description = "List of secondary IP ranges for alias IPs (e.g., GKE pods/services)"
  default     = []
}
