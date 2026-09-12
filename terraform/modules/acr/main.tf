# Azure Container Registry (ACR) Module

resource "azurerm_container_registry" "acr" {
  name                = "${var.prefix}acr${var.environment}${var.random_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false

  tags = var.tags
}
