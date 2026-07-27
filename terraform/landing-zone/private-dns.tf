module "private_dns" {

  source = "../modules/private-dns"

  private_dns_zone_name = var.private_dns_zone_name

  resource_group_name = module.resource_group.resource_group_name

  virtual_network_id = module.hub_network.hub_vnet_id

  virtual_network_name = module.hub_network.hub_vnet_name

  tags = local.common_tags

}