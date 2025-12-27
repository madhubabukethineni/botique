terraform {
  backend "gcs" {}
}

module "subnets" {
  source   = "../../../modules/subnet"
  for_each = var.subnetworks

  name                     = each.value.name
  ip_cidr_range            = each.value.ip_cidr_range
  network                  = each.value.network_name
  region                   = each.value.region
  project                  = each.value.project_id
  description               = each.value.description
  enable_flow_logs         = each.value.enable_flow_logs
  private_ip_google_access = each.value.private_ip_google_access
  secondary_ip_ranges      = each.value.secondary_ip_ranges
}
