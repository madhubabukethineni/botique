variable "project_id" {
  description = "The ID of the GCP project where the cluster will be created"
  type        = string
}

variable "region" {
  description = "The region in which the cluster will be created"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "network_self_link" {
  description = "The self link of the VPC network"
  type        = string
}

variable "subnet_self_link" {
  description = "The self link of the subnet"
  type        = string
}

variable "cluster_secondary_range" {
  description = "The secondary range name for cluster pods"
  type        = string
}

variable "services_secondary_range" {
  description = "The secondary range name for cluster services"
  type        = string
}

variable "enable_private_nodes" {
  description = "Whether to enable private nodes for the cluster"
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  description = "Whether the master's endpoint is private"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation for the master"
  type        = string
  default     = null
}

variable "workload_identity" {
  description = "Whether to enable Workload Identity"
  type        = bool
  default     = true
}

variable "logging_service" {
  description = "The logging service to use for the GKE cluster"
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  description = "The monitoring service to use for the GKE cluster"
  type        = string
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "release_channel" {
  description = "The release channel for the cluster (e.g., RAPID, REGULAR, STABLE)"
  type        = string
  default     = ""
}

