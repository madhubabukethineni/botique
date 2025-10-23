variable "project_id" { type = string }
variable "name"       { type = string }
variable "auto_create_subnetworks" { type = bool, default = false }
variable "routing_mode" { type = string, default = "REGIONAL" }
variable "description" { type = string, default = "" }
