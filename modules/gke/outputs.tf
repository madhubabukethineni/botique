output "name" {
  value = google_container_cluster.this.name
}

output "endpoint" {
  value = google_container_cluster.this.endpoint
}

output "private_endpoint" {
  value = try(google_container_cluster.this.private_cluster_config[0].private_endpoint, null)
}

output "self_link" {
  value = google_container_cluster.this.self_link
}

output "network" {
  value = google_container_cluster.this.network
}

output "subnetwork" {
  value = google_container_cluster.this.subnetwork
}
