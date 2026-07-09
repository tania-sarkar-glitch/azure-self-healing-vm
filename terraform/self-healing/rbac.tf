resource "azurerm_role_assignment" "key_vault_access" {

  scope = module.key_vault.key_vault_id

  role_definition_name = "Key Vault Secrets User"

  principal_id = module.managed_identity.principal_id

}