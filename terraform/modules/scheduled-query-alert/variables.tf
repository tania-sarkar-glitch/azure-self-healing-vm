variable "alert_name" {
  description = "Scheduled Query Alert name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  type        = string
}

variable "action_group_id" {
  description = "Action Group ID"
  type        = string
}

variable "query" {
  description = "KQL Query"
  type        = string
}

variable "severity" {
  type    = number
  default = 2
}

variable "evaluation_frequency" {
  type    = string
  default = "PT5M"
}

variable "window_duration" {
  type    = string
  default = "PT5M"
}

variable "tags" {
  type = map(string)
}