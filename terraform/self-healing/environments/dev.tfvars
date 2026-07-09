# Environment
####################################

environment = "dev"

# Resource Group
####################################

resource_group_name = "rg-selfheal-dev"
location            = "westus"

# Networking
####################################

vnet_name      = "vnet-selfheal-dev"
subnet_name    = "snet-selfheal-dev"
nsg_name       = "nsg-selfheal-dev"
public_ip_name = "pip-selfheal-dev"
nic_name       = "nic-selfheal-dev"

address_space = [
  "10.0.0.0/16"
]

subnet_prefix = [
  "10.0.1.0/24"
]

# Virtual Machine
####################################

vm_name        = "vm-selfheal-dev"
vm_size        = "Standard_D2s_v3"
admin_username = "azureuser"

ssh_public_key = "YOUR SSH KEY HERE"

os_disk_type = "Standard_LRS"


# Managed Identity
####################################

identity_name = "id-selfheal-dev"


# Key Vault
####################################

key_vault_name = "kv-selfheal-dev"
tenant_id      = "YOUR-TENANT-ID"
key_vault_sku  = "standard"

# Log Analytics
####################################

log_analytics_workspace_name = "law-selfheal-dev"