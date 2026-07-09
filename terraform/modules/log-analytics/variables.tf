variable "workspace_name" {
  description = "Azure Log Analytics Workspace name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sku" {
  description = "Workspace SKU"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Retention period in days"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}