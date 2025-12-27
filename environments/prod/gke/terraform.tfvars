gke_clusters = {
  prod_autopilot = {
    project_id = "k8s-prep-433307"        # GCP project ID
    location   = "europe-west1"           # Cluster region
    network    = "prod-vpc"               # VPC network name
    subnetwork = "prod-subnet-1"          # Subnet name

    enable_autopilot = true               # Autopilot mode enabled
    description      = "Production GKE Autopilot Cluster"

    release_channel = "REGULAR"           # Release channel (STABLE, REGULAR, RAPID)

    ip_allocation_policy = {
      cluster_secondary_range_name  = "pods"       # Secondary range for pods
      services_secondary_range_name = "services"   # Secondary range for services
    }

    private_cluster_config = {
      enable_private_nodes    = true
      enable_private_endpoint = true
      master_ipv4_cidr_block  = "172.16.0.0/28"
    }

    workload_identity = true

    addons_config = {
      http_load_balancing        = true
      horizontal_pod_autoscaling = true
    }

    network_policy_config = {
      enabled  = true
      provider = "CALICO"
    }

    logging_components    = ["SYSTEM_COMPONENTS"]
    monitoring_components = ["SYSTEM_COMPONENTS"]

    node_pools = {
      default = {
        name         = "default-pool"
        machine_type = "e2-medium"
        min_count    = 1
        max_count    = 3
        disk_size_gb = 100
        preemptible  = false
      }
      gpu_pool = {
        name         = "gpu-pool"
        machine_type = "n1-standard-4"
        min_count    = 0
        max_count    = 2
        disk_size_gb = 200
        preemptible  = true
      }
    }
  }

  nonprod_standard = {
    project_id = "k8s-prep-433307"
    location   = "europe-west1"
    network    = "nonprod-vpc"
    subnetwork = "nonprod-subnet"

    enable_autopilot = false
    description      = "Non-Prod Standard Cluster"
  }
}
