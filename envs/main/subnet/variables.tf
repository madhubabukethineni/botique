variable "project_id" { type = string }
variable "region"     { type = string }
variable "subnet_name" { type = string }
variable "ip_cidr_range" { type = string }
variable "private_ip_google_access" { type = bool, default = true }
variable "secondary_ip_ranges" { type = list(object({ range_name=string, ip_cidr_range=string })) }
