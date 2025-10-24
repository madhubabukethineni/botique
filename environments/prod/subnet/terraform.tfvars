project_id = "k8s-prep-433307"
region = "asia-south1"
subnet_name = "prod-subnet"
ip_cidr_range = "10.0.1.0/24"
private_ip_google_access = true
secondary_ip_ranges = [
  { range_name = "pods", ip_cidr_range = "10.1.0.0/16" },
  { range_name = "services", ip_cidr_range = "10.2.0.0/20" }
]
