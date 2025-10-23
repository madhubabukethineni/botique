output "cluster_name" { value = google_container_cluster.primary.name }
output "endpoint" { value = google_container_cluster.primary.endpoint }
output "cluster_self_link" { value = google_container_cluster.primary.self_link }
output "master_ipv4_cidr_block" { value = try(google_container_cluster.primary.private_cluster_config[0].master_ipv4_cidr_block, null) }
