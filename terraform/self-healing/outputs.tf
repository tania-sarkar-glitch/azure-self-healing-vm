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
  value = module.log_analytics.workspace_resource_id
}

output "log_analytics_workspace_name" {
  description = "Log Analytics Workspace name"

  value = module.log_analytics.workspace_name
}

output "action_group_id" {
  description = "Azure Monitor Action Group ID"
  value       = module.action_group.action_group_id
}

output "action_group_name" {
  description = "Azure Monitor Action Group name"
  value       = module.action_group.action_group_name
}

output "scheduled_query_alert_id" {
  value = module.scheduled_query_alert.scheduled_query_alert_id
}

output "scheduled_query_alert_name" {
  value = module.scheduled_query_alert.scheduled_query_alert_name
}

output "diagnostic_setting_id" {
  value = module.diagnostic_settings.diagnostic_setting_id
}