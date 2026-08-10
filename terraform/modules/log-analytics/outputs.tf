output "workspace_resource_id" {
  description = "Log Analytics Workspace ID"
  value       = azurerm_log_analytics_workspace.this.id
}

output "workspace_name" {
  description = "Log Analytics Workspace name"

  value = azurerm_log_analytics_workspace.this.name
}