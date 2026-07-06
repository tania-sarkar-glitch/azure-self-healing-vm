variable "identity_name" {
  description = "User Assigned Managed Identity name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}