module "azure_monitor_agent" {

  source = "../modules/azure-monitor-agent"

  location = var.location

  resource_group_name = module.resource_group.resource_group_name

  vm_id = module.virtual_machine.vm_id

  workspace_id = module.log_analytics.workspace_id

  workspace_resource_id = module.log_analytics.workspace_resource_id

  tags = local.common_tags

}