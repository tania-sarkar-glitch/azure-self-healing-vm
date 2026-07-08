locals {

  common_tags = {

    Environment = var.environment

    Project = "Azure Self-Healing Platform"

    Owner = "Tania Sarkar"

    ManagedBy = "Terraform"

    Repository = "azure-self-healing-vm"

  }
  
  name_prefix = "${var.environment}-${var.location}"
}