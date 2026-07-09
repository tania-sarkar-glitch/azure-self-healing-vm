resource "azurerm_virtual_network" "spoke" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  address_space = var.address_space

  tags = var.tags
}

resource "azurerm_subnet" "workload_subnet" {
  name                 = var.subnet_name
  resource_group_name = module.resource_group.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke.name

  address_prefixes = [var.subnet_prefix]
}