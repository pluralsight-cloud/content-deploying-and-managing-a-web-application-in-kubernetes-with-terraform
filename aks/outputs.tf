output "resource_group_name" {
  value = azurerm_resource_group.guru.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.guru.name
}