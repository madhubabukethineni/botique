subnetworks = {
  prod_subnet_1 = {
    name          = "prod-subnet-1"
    ip_cidr_range = "10.10.1.0/24"
    network_name = "projects/k8s-prep-433307/global/networks/prod-vpc"
    region        = "europe-west1"
    project_id    = "k8s-prep-433307"

    enable_flow_logs         = true
    private_ip_google_access = true

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
    network       = "projects/k8s-prep-433307/global/networks/nonprod-vpc"
    region        = "europe-west1"
  }
}
