output "cluster_ids" {
  value = google_container_cluster.this.*.id
}

output "cluster_endpoints" {
  value = google_container_cluster.this.*.endpoint
}