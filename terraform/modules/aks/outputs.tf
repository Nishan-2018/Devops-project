output "aks_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "AKS Cluster ID"
}

output "aks_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "AKS Cluster Name"
}

output "oidc_issuer_url" {
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  description = "OIDC Issuer URL for Workload Identity"
}

output "key_vault_secret_provider_client_id" {
  value       = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].client_id
  description = "Managed Identity Client ID for Key Vault Secret Provider"
}
