variable "subnetworks" {
  description = "Map of subnet configurations keyed by name"

  type = map(object({
    name                     = string
    ip_cidr_range            = string
    network                  = string
    region                   = string

    description               = optional(string)
    enable_flow_logs          = optional(bool)
    private_ip_google_access  = optional(bool)
    project                   = optional(string)
    secondary_ip_ranges       = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))

  default = {}
}
