variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "westus"
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

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}
