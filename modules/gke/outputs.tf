output "name" {
  description = "Name of the GKE cluster"
  value       = google_container_cluster.this.name
}

output "endpoint" {
  description = "Endpoint for the GKE control plane"
  value       = google_container_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  description = "Base64 encoded CA cert for the cluster"
  value       = google_container_cluster.this.master_auth[0].cluster_ca_certificate
}

output "status" {
  description = "Status of the cluster"
  value       = google_container_cluster.this.status
}
