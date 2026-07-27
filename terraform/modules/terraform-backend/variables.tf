variable "resource_group_name" {
  description = "Resource Group for Terraform backend"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account for Terraform state"
  type        = string
}

variable "container_name" {
  description = "Blob container for Terraform state"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}