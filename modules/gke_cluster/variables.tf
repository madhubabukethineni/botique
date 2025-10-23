variable "project_id" { type = string }
variable "region"     { type = string }
variable "cluster_name" { type = string }
variable "network_self_link" { type = string }
variable "subnet_self_link" { type = string }
variable "cluster_secondary_range" { type = string }
variable "services_secondary_range" { type = string }
variable "enable_private_nodes" { type = bool, default = true }
variable "enable_private_endpoint" { type = bool, default = false }
variable "master_ipv4_cidr_block" { type = string, default = null }
variable "workload_identity" { type = bool, default = true }
variable "logging_service"    { type = string, default = "logging.googleapis.com/kubernetes" }
variable "monitoring_service" { type = string, default = "monitoring.googleapis.com/kubernetes" }
variable "release_channel" { type = string, default = "" }
