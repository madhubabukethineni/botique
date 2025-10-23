output "node_pools" {
  value = [for np in google_container_node_pool.pools : np.name]
}
