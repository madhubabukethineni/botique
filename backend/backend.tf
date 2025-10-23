terraform {
  backend "gcs" {
    bucket = "k8s-prep-terraform-states"    # <-- change to your bucket
    prefix = "terraform/gke/k8s-prep-433307"
  }
}
