variable "project_id" {
  description = "The ID of the GCP project where the subnet will be created."
  type        = string
}

variable "region" {
  description = "The region where the subnet will be created."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "ip_cidr_range" {
  description = "The primary IPv4 CIDR range for the subnet."
  type        = string
}

variable "private_ip_google_access" {
  description = "Whether VMs in this subnet can access Google services without a public IP."
  type        = bool
  default     = true
}

variable "secondary_ip_ranges" {
  description = "List of secondary IP ranges for use with GKE pods and services."
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
  default = []
}
variable "network_name" {
  description = "The self link of the VPC network to which this subnet belongs."
  type        = string
}