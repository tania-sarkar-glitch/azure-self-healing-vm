module "scheduled_query_alert" {

  source = "../modules/scheduled-query-alert"

  alert_name = var.scheduled_query_alert_name

  location = var.location

  resource_group_name = module.resource_group.resource_group_name

  log_analytics_workspace_id = module.log_analytics.workspace_id

  action_group_id = module.action_group.action_group_id

  query = file("${path.module}/queries/${var.scheduled_query_file}")

  tags = local.common_tags

}