output "storage_account_name" {
  value = azurerm_storage_account.terraform_state.name
}

output "container_name" {
  value = azurerm_storage_container.terraform_state.name
}

output "resource_group_name" {
  description = "Name of the resource group containing the Terraform backend"
  value       = var.resource_group_name
}