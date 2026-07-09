module "policy" {

  source = "../modules/policy"

  policy_name = "allowed-locations"

  location = var.location

  resource_group_id = module.resource_group.resource_group_id

}