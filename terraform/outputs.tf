output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Azure Resource Group Name"
}

output "acr_login_server" {
  value       = module.acr.acr_login_server
  description = "ACR Login Server Endpoint"
}

output "aks_cluster_name" {
  value       = module.aks.aks_name
  description = "AKS Cluster Name"
}

output "key_vault_name" {
  value       = module.keyvault.key_vault_name
  description = "Key Vault Name"
}
