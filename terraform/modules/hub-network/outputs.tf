output "hub_vnet_id" {
  description = "Resource ID of the Hub Virtual Network"
  value       = azurerm_virtual_network.hub.id
}

output "hub_vnet_name" {
  description = "Name of the Hub Virtual Network"
  value       = azurerm_virtual_network.hub.name
}