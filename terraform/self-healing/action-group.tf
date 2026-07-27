module "action_group" {

  source = "../modules/action-group"

  action_group_name = var.action_group_name

  short_name = var.action_group_short_name

  resource_group_name = module.resource_group.resource_group_name

  email_receiver_name = var.action_group_receiver_name

  email_address = var.action_group_email

  tags = local.common_tags
}