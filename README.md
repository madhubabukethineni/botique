Terraform GKE starter for project <Project>

Structure:
- modules/: reusable child modules (vpc, subnet, gke_cluster, node_pool)
- envs/dev/: root configs for the dev environment which call the modules
- backend/: central backend config (update bucket name)

Defaults chosen:
- project_id: <PRoject-ID>
- region: asia-south1
- zone: asia-south1-a
- VPC CIDR defaults: 10.0.0.0/16 (you can customize in tfvars)
- Subnet CIDR defaults: 10.0.1.0/24
- Single backend prefix per environment (change in backend/backend.tf and envs/* if needed)

How to use:
1. Create GCS bucket for tf state and update backend/backend.tf (bucket name).
2. From envs/dev/vpc/ run:
   terraform init -backend-config="../../backend/backend.tf"
   terraform apply -var-file=terraform.tfvars
3. Apply subsequent modules in order: vpc -> subnet -> gke -> node_pool
4. After cluster creation run: gcloud container clusters get-credentials <cluster> --region asia-south1 --project <Project-id>

Note: This is a starter template — review variables and IAM before using in production.
