project_id = "k8s-prep-433307"
region = "asia-south1"
cluster_name = "prod-gke"
node_pools = [
  { name = "system-pool", machine_type = "e2-medium", node_count = 2, min_count = 1, max_count = 3, preemptible = false },
  { name = "workload-pool", machine_type = "e2-standard-4", node_count = 2, min_count = 1, max_count = 3, preemptible = false }
]
