variable "private_endpoint_name" {
  description = "Private Endpoint name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group"
  type        = string
}

variable "subnet_id" {
  description = "Private Endpoint subnet ID"
  type        = string
}

variable "private_connection_resource_id" {
  description = "Target Azure resource ID"
  type        = string
}

variable "subresource_names" {
  description = "Azure subresource names"
  type        = list(string)
}

variable "private_dns_zone_ids" {
  description = "Private DNS Zone IDs"
  type        = list(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}