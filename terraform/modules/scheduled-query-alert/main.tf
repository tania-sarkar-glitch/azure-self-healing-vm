resource "azurerm_monitor_scheduled_query_rules_alert_v2" "this" {

  name                = var.alert_name
  location            = var.location
  resource_group_name = var.resource_group_name

  evaluation_frequency = var.evaluation_frequency
  window_duration      = var.window_duration

  scopes = [
    var.log_analytics_workspace_id
  ]

  severity    = var.severity
  enabled     = true
  description = "Scheduled Query Alert created by Terraform"

  criteria {

    query = var.query

    operator = "GreaterThan"

    threshold = 0

    time_aggregation_method = "Count"

  }

  action {

    action_groups = [
      var.action_group_id
    ]

  }

  tags = var.tags
}