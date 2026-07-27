output "action_group_id" {
  description = "Azure Monitor Action Group ID"
  value       = azurerm_monitor_action_group.this.id
}

output "action_group_name" {
  description = "Azure Monitor Action Group name"
  value       = azurerm_monitor_action_group.this.name
}