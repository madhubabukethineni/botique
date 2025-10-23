variable "project_id" {
     type = string
}
variable "region" {
     type = string
}
variable "cluster_name" {
     type = string
}
variable "cluster_secondary_range" {
     type = string
}
variable "services_secondary_range" {
     type = string
}
variable "master_ipv4_cidr_block" {
     type = string
}
variable "release_channel" {
     type = string
     default = ""
}
