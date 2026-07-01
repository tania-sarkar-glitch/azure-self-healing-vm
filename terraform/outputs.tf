# ======================================
# Outputs
# ======================================

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vm_name" {
  value = module.virtual_machine.vm_name
}

output "public_ip_address" {
  value = module.networking.public_ip_address
}

output "virtual_network_name" {
  value = module.networking.virtual_network_name
}