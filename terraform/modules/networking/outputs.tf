output "network_interface_id" {
  value = azurerm_network_interface.nic.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}