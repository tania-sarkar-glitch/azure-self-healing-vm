variable "vnet_name" {
  description = "Name of the Spoke Virtual Network"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "address_space" {
  description = "Spoke VNet address space"
  type        = list(string)
}

variable "subnet_name" {
  description = "Workload subnet name"
  type        = string
}

variable "subnet_prefix" {
  description = "Workload subnet CIDR"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}