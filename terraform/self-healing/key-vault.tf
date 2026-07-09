module "key_vault" {

  source = "../modules/key-vault"

  key_vault_name      = var.key_vault_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  tenant_id = var.tenant_id
  sku_name  = var.key_vault_sku

  tags = local.common_tags
}