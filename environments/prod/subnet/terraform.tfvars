subnetworks = {
  prod_subnet_1 = {
    name          = "prod-subnet-1"
    ip_cidr_range = "10.10.1.0/24"
    network_name = "prod-vpc"
    region        = "europe-west1"
    project_id    = "k8s-prep-433307"

    private_ip_google_access = true
    log_config = {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.7
      metadata             = "INCLUDE_ALL_METADATA"
    }

    secondary_ip_ranges = [
      { range_name = "pods"
       ip_cidr_range = "192.168.64.0/22"
      },

      { range_name = "services"
       ip_cidr_range = "192.168.0.0/24" 
      }
    ]
  }

  nonprod_subnet = {
    name          = "nonprod-subnet"
    ip_cidr_range = "10.20.1.0/24"
    network_name = "nonprod-vpc"
    region        = "europe-west1"
  }
}
