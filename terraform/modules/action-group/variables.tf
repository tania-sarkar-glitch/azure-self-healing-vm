variable "action_group_name" {
  description = "Azure Monitor Action Group name"
  type        = string
}

variable "short_name" {
  description = "Short name (max 12 characters)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "email_receiver_name" {
  description = "Email receiver name"
  type        = string
}

variable "email_address" {
  description = "Notification email address"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}