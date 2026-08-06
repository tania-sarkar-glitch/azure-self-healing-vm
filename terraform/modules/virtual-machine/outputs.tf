output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_private_ip" {
  description = "Private IP of the Virtual Machine"

  value = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "vm_identity_principal_id" {
  description = "Principal ID of the VM's Managed Identity"

  value = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}