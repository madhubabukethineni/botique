output "cluster_name" {
  value = google_container_cluster.this.name
}

output "endpoint" {
  value = google_container_cluster.this.endpoint
}

output "id" {
  value = google_container_cluster.this.id
}