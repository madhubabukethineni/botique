data "terraform_remote_state" "vpc_state" {
  backend = "gcs"
  config = {
    bucket = "k8s-prep-terraform-states"
    prefix = "terraform/gke/k8s-prep-433307"
  }
}

module "subnet" {
  source = "../../modules/subnet"
  project_id = var.project_id
  region     = var.region
  name       = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  network_self_link = data.terraform_remote_state.vpc_state.outputs.network_self_link
  private_ip_google_access = var.private_ip_google_access
  secondary_ip_ranges = var.secondary_ip_ranges
}
