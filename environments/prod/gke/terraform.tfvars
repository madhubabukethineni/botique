gke_clusters = {
  prod-autopilot = {
    project_id       = "k8s-prep-433307"
    location         = "europe-west1"
    network          = "prod-vpc"
    subnetwork       = "prod-subnet-1"
    enable_autopilot = true
    release_channel  = "REGULAR"

    ip_allocation_policy = {
      cluster_secondary_range_name  = "pods"
      services_secondary_range_name = "services"
    }

    private_cluster_config = {
      enable_private_nodes    = true
      enable_private_endpoint = true
      master_ipv4_cidr_block  = "172.16.0.0/28"
    }
    workload_identity = true
  }

  nonprod-standard = {
    project_id       = "k8s-prep-433307"
    location         = "europe-west1"
    network          = "nonprod-vpc"
    subnetwork       = "nonprod-subnet"
    enable_autopilot = false

    node_pools = {
      default = {
        name         = "default-pool"
        machine_type = "e2-medium"
        min_count    = 1
        max_count    = 3
        disk_size_gb = 100
      }
    }
    network_policy_config = {
      enabled  = true
      provider = "CALICO"
    }
  }
}