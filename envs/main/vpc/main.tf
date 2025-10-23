data "terraform_remote_state" "vpc_state" {
  backend = "gcs"
  config = {
    bucket = "terraform-backend-state-prod"
    prefix = "prod/terraform"
  }
}

module "vpc" {
  source = "../../../modules/vpc"
  project_id = var.project_id
  name       = var.vpc_name
}
