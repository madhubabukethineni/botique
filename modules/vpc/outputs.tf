output "network_self_link" {
  value = google_compute_network.this.self_link
}
output "network_name" {
  value = google_compute_network.this.name
}
output "network_self_link" {
  description = "The self link of the VPC network."
  value       = google_compute_network.this.self_link
}
