variable "project_id" {
     type = string
} 
variable "region" {
     type = string
} 
variable "node_pools" { 
    type = list(any) 
    default = []
}
variable "cluster_name" {
  description = "The name of the GKE cluster to which the node pools will be added."
  type        = string
}