output "spoke_vnet_id" {
  description = "Resource ID of spoke vnet"
  value       = azurerm_virtual_network.spoke.id
}

output "spoke_vnet_name" {
  description = "Resource name of spoke vnet"
  value       = azurerm_virtual_network.spoke.name
}