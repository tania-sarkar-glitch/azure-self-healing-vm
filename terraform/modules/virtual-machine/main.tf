# ======================================
# Azure Linux Virtual Machine
# ======================================

resource "azurerm_linux_virtual_machine" "vm" {

  name = var.vm_name

  identity {

    type = "UserAssigned"

    identity_ids = [
      var.managed_identity_id
    ]

  }

  tags                = var.tags
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username = var.admin_username

  network_interface_ids = [
    var.network_interface_id
  ]

  disable_password_authentication = true
  patch_mode                      = "ImageDefault"
  patch_assessment_mode           = "ImageDefault"

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  boot_diagnostics {
    storage_account_uri = null
  }
  computer_name = var.vm_name

  custom_data = base64encode(var.custom_data)

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
