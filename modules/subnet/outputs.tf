output "id" {
  description = "ID of the subnetwork"
  value       = google_compute_subnetwork.subnet.id
}

output "self_link" {
  description = "Self link of the subnetwork"
  value       = google_compute_subnetwork.subnet.self_link
}

output "gateway_address" {
  description = "Gateway address of the subnetwork"
  value       = google_compute_subnetwork.subnet.gateway_address
}
