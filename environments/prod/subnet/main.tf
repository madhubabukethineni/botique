terraform {
  backend "gcs" {}
}

module "subnet" {
  source = "../../../modules/subnet"
  project_id = var.project_id
  region     = var.region
  name       = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  network_name = var.network_name
  private_ip_google_access = var.private_ip_google_access
  secondary_ip_ranges = var.secondary_ip_ranges
}
