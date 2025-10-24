terraform {
  backend "gcs" {}
}

module "node_pool" {
  source = "../../../modules/node_pool"
  project_id = var.project_id
  region = var.region
  cluster_name = data.terraform_remote_state.gke_state.outputs.cluster_name
  node_pools = var.node_pools
}
