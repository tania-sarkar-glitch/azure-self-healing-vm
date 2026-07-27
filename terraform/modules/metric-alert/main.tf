resource "azurerm_monitor_metric_alert" "heartbeat" {

  name = var.alert_name

  resource_group_name = var.resource_group_name

  scopes = var.scopes

  description = "VM heartbeat missing"

  severity = var.severity

  enabled = true

  criteria {

    metric_namespace = "Microsoft.Compute/virtualMachines"

    metric_name = "Heartbeat"

    aggregation = "Count"

    operator = "LessThan"

    threshold = 1

  }

  action {

    action_group_id = var.action_group_id

  }

  tags = var.tags

}