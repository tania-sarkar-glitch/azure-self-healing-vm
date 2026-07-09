# ======================================
# Outputs
# ======================================

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vm_name" {
  value = module.virtual_machine.vm_name
}

output "public_ip_address" {
  value = module.networking.public_ip_address
}

output "virtual_network_name" {
  value = module.networking.virtual_network_name
}

output "key_vault_name" {
  value = module.key_vault.key_vault_name
}

output "key_vault_uri" {
  value = module.key_vault.key_vault_uri
}

output "managed_identity_id" {
  value = module.managed_identity.identity_id
}

output "managed_identity_principal_id" {
  value = module.managed_identity.principal_id
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"

  value = module.log_analytics.workspace_id
}

output "log_analytics_workspace_name" {
  description = "Log Analytics Workspace name"

  value = module.log_analytics.workspace_name
}