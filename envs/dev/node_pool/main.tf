data "terraform_remote_state" "gke_state" {
  backend = "gcs"
  config = { bucket = "k8s-prep-terraform-states", prefix = "terraform/gke/k8s-prep-433307" }
}

module "node_pool" {
  source = "../../modules/node_pool"
  project_id = var.project_id
  region = var.region
  cluster_name = data.terraform_remote_state.gke_state.outputs.cluster_name
  node_pools = var.node_pools
}
