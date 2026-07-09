resource "azurerm_resource_group_policy_assignment" "allowed_location" {

  name = var.policy_name

  resource_group_id = var.resource_group_id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"

  location = var.location

}