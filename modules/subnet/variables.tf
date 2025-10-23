variable "project_id" {
  description = "The ID of the GCP project where the subnetwork will be created."
  type        = string
}

variable "region" {
  description = "The region where the subnetwork will be created."
  type        = string
}

variable "name" {
  description = "The name of the subnetwork."
  type        = string
}

variable "ip_cidr_range" {
  description = "The primary IP CIDR range of the subnetwork."
  type        = string
}

variable "network_self_link" {
  description = "The self link of the VPC network to which this subnetwork belongs."
  type        = string
}

variable "private_ip_google_access" {
  description = "Enable private Google access for the subnetwork."
  type        = bool
  default     = true
}

variable "secondary_ip_ranges" {
  description = "List of secondary IP ranges for use with GKE Pods and Services."
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
  default = []
}
