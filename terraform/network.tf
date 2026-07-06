module "networking" {
  source = "./modules/networking"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  vnet_name      = var.vnet_name
  subnet_name    = var.subnet_name
  nsg_name       = var.nsg_name
  public_ip_name = var.public_ip_name
  nic_name       = var.nic_name

  address_space = var.address_space
  subnet_prefix = var.subnet_prefix
  tags = local.common_tags
}