resource "azurerm_key_vault" "kv" {

  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id

  sku_name = var.sku_name

  rbac_authorization_enabled = true

  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  tags = var.tags

}