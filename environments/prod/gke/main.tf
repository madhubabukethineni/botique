terraform {
  backend "gcs" {}
}

module "gke" {
  source = "../../../modules/gke_cluster"
  project_id = var.project_id
  region = var.region
  cluster_name = var.cluster_name
  network = var.network_name
  subnet  = var.subnet_name
  cluster_secondary_range = var.cluster_secondary_range
  services_secondary_range = var.services_secondary_range
  enable_private_nodes = true
  enable_private_endpoint = false
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  release_channel = var.release_channel
}
