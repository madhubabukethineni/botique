variable "project_id" {
  description = "The ID of the GCP project where the VPC network will be created."
  type        = string
}

variable "name" {
  description = "The name of the VPC network."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "When set to true, the network is created in auto mode with default subnets. Disable for custom subnet creation."
  type        = bool
  default     = false
}

variable "routing_mode" {
  description = "The network-wide routing mode. Valid values are REGIONAL or GLOBAL."
  type        = string
  default     = "REGIONAL"
}

variable "description" {
  description = "Optional description for the network."
  type        = string
  default     = ""
}
