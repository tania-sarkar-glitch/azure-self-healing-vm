output "diagnostic_setting_id" {
  description = "Diagnostic Setting ID"

  value = azurerm_monitor_diagnostic_setting.this.id
}