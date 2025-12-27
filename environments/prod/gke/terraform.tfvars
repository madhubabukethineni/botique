gke_clusters = {
  prod = {
    project_id = "my-gcp-project"
    location   = "europe-west1"
    network    = "projects/my-gcp-project/global/networks/prod-vpc"
    subnetwork = "projects/my-gcp-project/regions/europe-west1/subnetworks/prod-subnet"

    # Enable Autopilot
    enable_autopilot = true

    # Standard cluster overrides — optional
    ip_allocation_policy = {
      cluster_secondary_range_name  = "pods"
      services_secondary_range_name = "services"
      use_ip_aliases                = true
    }

    private_cluster_config = {
      enable_private_nodes    = true
      enable_private_endpoint = true
      master_ipv4_cidr_block  = "172.16.0.0/28"
    }

    workload_identity     = true
    logging_components    = ["SYSTEM_COMPONENTS"]
    monitoring_components = ["SYSTEM_COMPONENTS"]

    node_pools = {}
  }
}
