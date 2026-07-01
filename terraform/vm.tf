module "virtual_machine" {

  source = "./modules/virtual-machine"

  resource_group_name = module.resource_group.resource_group_name

  network_interface_id = module.networking.network_interface_id

  location = var.location

  vm_name = var.vm_name

  vm_size = var.vm_size

  admin_username = var.admin_username

  ssh_public_key = var.ssh_public_key

}