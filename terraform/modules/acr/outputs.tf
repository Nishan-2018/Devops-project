output "acr_id" {
  value       = azurerm_container_registry.acr.id
  description = "Azure Container Registry ID"
}

output "acr_login_server" {
  value       = azurerm_container_registry.acr.login_server
  description = "Azure Container Registry Login Server URL"
}

output "acr_name" {
  value       = azurerm_container_registry.acr.name
  description = "Azure Container Registry Name"
}
