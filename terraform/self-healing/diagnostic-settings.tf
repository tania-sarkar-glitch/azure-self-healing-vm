module "diagnostic_settings" {

  source = "../modules/diagnostic-settings"

  diagnostic_name = var.diagnostic_setting_name

  target_resource_id = module.virtual_machine.vm_id

  log_analytics_workspace_id = module.log_analytics.workspace_resource_id

  enabled_log_categories = []

  enabled_metric_categories = [
    "AllMetrics"
  ]

}