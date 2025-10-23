terraform {
  backend "gcs" {
    bucket = "terraform-backend-state-prod"    # <-- change to your bucket
    prefix = "prod/terraform"
  }
}
