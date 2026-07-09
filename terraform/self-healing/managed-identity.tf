module "managed_identity" {

  source = "../modules/managed-identity"

  identity_name       = var.identity_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  tags = local.common_tags
}