variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test or prod."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Landing Zone Resource Group"
  type        = string
}

#hub variables

variable "hub_vnet_name" {
  description = "Hub Virtual Network name"
  type        = string
}

variable "hub_address_space" {
  description = "Hub VNet address space"
  type        = list(string)
}

variable "gateway_subnet_prefix" {
  description = "GatewaySubnet CIDR"
  type        = string
}

variable "shared_services_subnet_prefix" {
  description = "Shared Services subnet CIDR"
  type        = string
}

#spoke_variable

variable "spoke_vnet_name" {
  description = "Spoke Virtual Network name"
  type        = string
}

variable "spoke_address_space" {
  description = "Spoke VNet address space"
  type        = list(string)
}

variable "workload_subnet_name" {
  description = "Workload subnet name"
  type        = string
}

variable "workload_subnet_prefix" {
  description = "Workload subnet CIDR"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS Zone Name"

  type = string
}