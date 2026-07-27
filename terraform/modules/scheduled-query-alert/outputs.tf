output "scheduled_query_alert_id" {
  description = "Scheduled Query Alert ID"

  value = azurerm_monitor_scheduled_query_rules_alert_v2.this.id
}

output "scheduled_query_alert_name" {
  description = "Scheduled Query Alert Name"

  value = azurerm_monitor_scheduled_query_rules_alert_v2.this.name
}