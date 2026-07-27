variable "alert_name" {
  description = "Heartbeat alert name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "scopes" {
  description = "Resources to monitor"
  type        = list(string)
}

variable "action_group_id" {
  description = "Action Group ID"
  type        = string
}

variable "severity" {
  description = "Alert severity"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}