variable "diagnostic_name" {
  description = "Diagnostic Settings name"
  type        = string
}

variable "target_resource_id" {
  description = "Azure Resource ID to enable diagnostics on"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  type        = string
}

/*
variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
*/

variable "enabled_log_categories" {
  description = "Diagnostic log categories"

  type = list(string)

  default = []
}

variable "enabled_metric_categories" {
  description = "Diagnostic metric categories"

  type = list(string)

  default = [
    "AllMetrics"
  ]
}