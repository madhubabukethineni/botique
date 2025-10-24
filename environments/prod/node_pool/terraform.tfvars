project_id = "k8s-prep-433307"
region = "asia-south1"
node_pools = [
  { name = "system-pool", machine_type = "e2-medium", node_count = 2, min_count = 1, max_count = 5, preemptible = false },
  { name = "workload-pool", machine_type = "e2-standard-4", node_count = 2, min_count = 1, max_count = 6, preemptible = false }
]
