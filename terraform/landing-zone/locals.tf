locals {
  common_tags = {
    Environment  = var.environment
    Project      = "Enterprise Landing Zone"
    Owner        = "Tania Sarkar"
    ManagedBy    = "Terraform"
    Repository   = "azure-self-healing-vm"
    Architecture = "Hub-Spoke"
  }
}