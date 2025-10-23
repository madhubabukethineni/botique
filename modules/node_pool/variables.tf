variable "project_id" { type = string }
variable "region"     { type = string }
variable "cluster_name" { type = string }

variable "node_pools" {
  type = list(object({
    name         = string
    machine_type = string
    node_count   = number
    preemptible  = optional(bool, false)
    min_count    = optional(number)
    max_count    = optional(number)
    taints       = optional(list(object({ key=string, value=string, effect=string })), [])
    labels       = optional(map(string), {})
    oauth_scopes = optional(list(string), ["https://www.googleapis.com/auth/cloud-platform"])
  }))
  default = []
}
