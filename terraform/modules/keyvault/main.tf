# Azure Key Vault Module with RBAC & Soft Delete

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = "${var.prefix}-kv-${var.environment}-${var.random_suffix}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

  enable_rbac_authorization = true

  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow"
  }

  tags = var.tags
}

# Grant current deployment identity Key Vault Secrets Officer role for RBAC secret creation
resource "azurerm_role_assignment" "kv_admin_secrets_officer" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

# Example Secret creation for Microservice DB connection string
resource "azurerm_key_vault_secret" "db_connection_string" {
  name         = "database-connection-string"
  value        = "Server=tcp:${var.prefix}-sql.database.windows.net,1433;Database=microservices_db;User ID=cloudadmin;Password=P@ssw0rd123456!;"
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_role_assignment.kv_admin_secrets_officer
  ]

  lifecycle {
    ignore_changes = [value]
  }
}
