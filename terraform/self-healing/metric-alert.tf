/*

module "cpu_alert" {

  source = "../modules/metric-alert"

  alert_name = var.cpu_alert_name

  resource_group_name = module.resource_group.resource_group_name

  scopes = [
    module.virtual_machine.vm_id
  ]

  description = "CPU usage exceeded threshold"

  metric_namespace = "Microsoft.Compute/virtualMachines"

  metric_name = "Percentage CPU"

  aggregation = "Average"

  operator = "GreaterThan"

  threshold = var.cpu_alert_threshold

  action_group_id = module.action_group.action_group_id

}

*/