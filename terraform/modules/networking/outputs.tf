output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Virtual Network ID"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Virtual Network Name"
}

output "aks_subnet_id" {
  value       = azurerm_subnet.aks_subnet.id
  description = "AKS Node Pool Subnet ID"
}

output "pe_subnet_id" {
  value       = azurerm_subnet.pe_subnet.id
  description = "Private Endpoint Subnet ID"
}
