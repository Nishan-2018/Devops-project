output "key_vault_id" {
  value       = azurerm_key_vault.kv.id
  description = "Azure Key Vault ID"
}

output "key_vault_uri" {
  value       = azurerm_key_vault.kv.vault_uri
  description = "Azure Key Vault Vault URI"
}

output "key_vault_name" {
  value       = azurerm_key_vault.kv.name
  description = "Azure Key Vault Name"
}
