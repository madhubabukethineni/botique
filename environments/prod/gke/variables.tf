# ==============================
# GKE Cluster Module Variables
# ==============================

variable "project_id" {
  description = "The GCP project ID where the cluster will be created"
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be deployed"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "cluster_secondary_range" {
  description = "The name of the secondary IP range for pods"
  type        = string
}

variable "services_secondary_range" {
  description = "The name of the secondary IP range for services"
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "The CIDR block for the GKE control plane"
  type        = string
  default     = null
}

variable "enable_private_nodes" {
  description = "Enable private nodes in the cluster"
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint for the cluster"
  type        = bool
  default     = false
}

variable "workload_identity" {
  description = "Enable Workload Identity for the cluster"
  type        = bool
  default     = true
}

variable "logging_service" {
  description = "Logging service used by the cluster"
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  description = "Monitoring service used by the cluster"
  type        = string
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "release_channel" {
  description = "Release channel for GKE (e.g., RAPID, REGULAR, STABLE)"
  type        = string
  default     = ""
}
variable "network_name" {
  description = "The self link of the VPC network"
  type        = string
}
variable "subnet_name" {
  description = "The self link of the subnet"
  type        = string
}