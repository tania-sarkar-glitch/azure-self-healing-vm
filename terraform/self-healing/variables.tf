# ======================================
# Input Variables
# Azure Self-Healing VM Infrastructure
# ======================================

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
}

variable "vm_size" {
  description = "Azure Virtual Machine size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP name"
  type        = string
}

variable "nic_name" {
  description = "Network Interface name"
  type        = string
}

variable "address_space" {
  description = "Virtual Network address space"
  type        = list(string)
}

variable "subnet_prefix" {
  description = "Subnet address prefix"
  type        = list(string)
}

variable "ssh_public_key" {
  description = "SSH public key used to access the Linux VM"
  type        = string
  sensitive   = true
}

variable "os_disk_type" {
  description = "Storage account type for the OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "key_vault_name" {
  description = "Azure Key Vault name"
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra ID Tenant ID"
  type        = string
}

variable "key_vault_sku" {
  description = "Key Vault SKU"
  type        = string
  default     = "standard"
}

variable "identity_name" {
  description = "User Assigned Managed Identity name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test or prod."
  }
}

variable "log_analytics_workspace_name" {
  description = "Azure Log Analytics Workspace name"
  type        = string
}

variable "action_group_name" {
  description = "Azure Monitor Action Group name"
  type        = string
}

variable "action_group_short_name" {
  description = "Short name for the Action Group"
  type        = string
}

variable "action_group_receiver_name" {
  description = "Email receiver display name"
  type        = string
}

variable "action_group_email" {
  description = "Email address for Azure Monitor notifications"
  type        = string
}

variable "scheduled_query_alert_name" {
  description = "Scheduled Query Alert name"
  type        = string
}

variable "scheduled_query_file" {
  description = "KQL query filename"
  type        = string
}

variable "diagnostic_setting_name" {
  description = "Diagnostic Setting name"
  type        = string
}