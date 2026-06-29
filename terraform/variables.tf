# ======================================
# Input Variables
# Azure Self-Healing VM Infrastructure
# ======================================

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

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

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet-demo"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet-demo"
}

variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
  default     = "nsg-demo"
}

variable "public_ip_name" {
  description = "Public IP name"
  type        = string
  default     = "publicip-demo"
}

variable "nic_name" {
  description = "Network Interface name"
  type        = string
  default     = "nic-demo"
}

variable "address_space" {
  description = "Virtual Network address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "Subnet address prefix"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "ssh_public_key" {
  description = "SSH public key used to access the Linux VM"
  type        = string
  sensitive   = true
}
