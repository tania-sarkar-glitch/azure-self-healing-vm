variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "westus"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "selfhealvm"
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
  default     = "azureuser"
}

variable "vm_size" {
  description = "Azure Virtual Machine size"
  type        = string
  default     = "Standard_D2s_v3"
}
variable "ssh_public_key" {
  description = "SSH public key used to access the Linux VM"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "network_interface_id" {
  description = "ID of the Network Interface attached to the Virtual Machine"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all Azure resources"
  type        = map(string)
}

variable "os_disk_type" {
  description = "Storage account type for the OS disk"
  type        = string
}