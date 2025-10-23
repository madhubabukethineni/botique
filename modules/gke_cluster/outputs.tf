output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.primary.name
}

output "endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = google_container_cluster.primary.endpoint
}

output "cluster_self_link" {
  description = "The self link of the GKE cluster."
  value       = google_container_cluster.primary.self_link
}

output "master_ipv4_cidr_block" {
  description = "The master IPv4 CIDR block of the private GKE cluster, null if not configured."
  value       = try(google_container_cluster.primary.private_cluster_config[0].master_ipv4_cidr_block, null)
}
