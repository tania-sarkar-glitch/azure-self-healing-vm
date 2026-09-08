module "resource_group" {
  source = "../modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags
}

module "terraform_backend" {
  source = "../modules/terraform-backend"

  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
  tags                 = local.common_tags

  depends_on = [
    module.resource_group
  ]
}