variable "subnetworks" {
  description = "Map of subnet configurations keyed by name"

  type = map(object({
    name                     = string
    ip_cidr_range            = string
    network_name             = string
    region                   = string

    description               = optional(string)
    private_ip_google_access  = optional(bool)
    project_id                = optional(string)
    log_config                = optional(object({
      aggregation_interval = optional(string)
      flow_sampling        = optional(number)
      metadata             = optional(string)
      metadata_fields      = optional(list(string))
    }))
    secondary_ip_ranges       = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))

  default = {}
}
