terraform {
  backend "gcs" {}
}

module "gke" {
  source = "../../../modules/gke_cluster"
  project_id = var.project_id
  region = var.region
  cluster_name = var.cluster_name
  network_self_link = data.terraform_remote_state.vpc_state.outputs.network_self_link
  subnet_self_link  = data.terraform_remote_state.subnet_state.outputs.subnet_self_link
  cluster_secondary_range = var.cluster_secondary_range
  services_secondary_range = var.services_secondary_range
  enable_private_nodes = true
  enable_private_endpoint = false
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  release_channel = var.release_channel
}
