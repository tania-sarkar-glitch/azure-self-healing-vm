output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "hub_vnet_name" {
  value = azurerm_virtual_network.hub.name
}

output "gateway_subnet_id" {
  value = azurerm_subnet.gateway.id
}

output "shared_services_subnet_id" {
  value = azurerm_subnet.shared_services.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint.id
}