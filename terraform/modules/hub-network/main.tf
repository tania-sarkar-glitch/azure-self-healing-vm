resource "azurerm_virtual_network" "hub" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = var.address_space

  tags = var.tags
}

resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.gateway_subnet]
}

resource "azurerm_subnet" "shared_services" {
  name                 = "SharedServices"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = [var.shared_services_subnet]
}

resource "azurerm_subnet" "private_endpoint" {

  name = "PrivateEndpoints"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes = [
    var.private_endpoint_subnet
  ]
  private_endpoint_network_policies = "Disabled"

}