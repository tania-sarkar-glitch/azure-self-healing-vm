variable "private_dns_zone_name" {
  description = "Azure Private DNS Zone name"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group"
  type        = string
}

variable "virtual_network_id" {
  description = "Hub Virtual Network ID"
  type        = string
}

variable "virtual_network_name" {
  description = "Hub Virtual Network Name"
  type        = string
}

variable "registration_enabled" {
  description = "Enable auto registration"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}