module "resource_group" {

  source = "../modules/resource-group"

  resource_group_name = var.resource_group_name

  location = var.location

  tags = local.common_tags

}

module "hub_network" {

  source = "../modules/hub-network"

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  vnet_name = var.hub_vnet_name

  address_space = var.hub_address_space

  gateway_subnet = var.gateway_subnet_prefix

  shared_services_subnet = var.shared_services_subnet_prefix

  private_endpoint_subnet = var.private_endpoint_subnet

  tags = local.common_tags

}

module "spoke_network" {

  source = "../modules/spoke-network"

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  vnet_name = var.spoke_vnet_name

  address_space = var.spoke_address_space

  subnet_name = var.workload_subnet_name

  subnet_prefix = var.workload_subnet_prefix

  tags = local.common_tags

}

module "vnet_peering" {

  source = "../modules/vnet-peering"

  hub_to_spoke_name = "hub-to-spoke"

  spoke_to_hub_name = "spoke-to-hub"

  hub_resource_group = module.resource_group.resource_group_name

  spoke_resource_group = module.resource_group.resource_group_name

  hub_vnet_name = module.hub_network.hub_vnet_name

  spoke_vnet_name = module.spoke_network.spoke_vnet_name

  hub_vnet_id = module.hub_network.hub_vnet_id

  spoke_vnet_id = module.spoke_network.spoke_vnet_id

}