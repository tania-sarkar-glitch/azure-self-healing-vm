variable "vnet_name" {
  description = "Name of the Hub Virtual Network"
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
  description = "Hub VNet address space"
  type        = list(string)
}

variable "gateway_subnet" {
  description = "GatewaySubnet CIDR"
  type        = string
}

variable "shared_services_subnet" {
  description = "Shared Services subnet CIDR"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}