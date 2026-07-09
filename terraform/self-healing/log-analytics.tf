module "log_analytics" {

  source = "../modules/log-analytics"

  workspace_name = var.log_analytics_workspace_name

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  tags = local.common_tags

}