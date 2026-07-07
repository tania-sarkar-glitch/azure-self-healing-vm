# 🏗️ Terraform Infrastructure

This directory contains the complete Terraform implementation of the **Azure Self-Healing VM Platform**.

The infrastructure follows a **modular architecture**, separating Azure resources into reusable modules while allowing the root module to orchestrate deployments through module outputs and input variables.

---

# 📦 Terraform Modules

| Module | Responsibility |
|----------|---------------|
| Resource Group | Creates the Azure Resource Group |
| Networking | Creates the Virtual Network, Subnet, Network Security Group, Public IP, and Network Interface |
| Virtual Machine | Deploys the Ubuntu Linux Virtual Machine |
| Managed Identity | Creates a User Assigned Managed Identity for secure Azure authentication |
| Key Vault | Deploys Azure Key Vault for secure secret management |

---

# 🏛️ Module Architecture

```text
                          Root Module
                               │
     ┌───────────────┬─────────┼───────────┬────────────────┐
     │               │         │           │                │
     ▼               ▼         ▼           ▼                ▼
Resource Group   Networking    VM    Managed Identity   Key Vault
     │               │         │           │                │
     │               │         │           └────────────┐   │
     │               │         │                        │   │
     │               └────────►NIC ID───────────────────┘   │
     │                         │                            │
     └────────────────────────►Resource Group───────────────┘
                               │
                               ▼
                     Complete Azure Infrastructure
```

The root module coordinates all deployments while individual modules remain independent and reusable.

---

# ⚙️ Terraform Features

- Modular Infrastructure as Code
- Reusable Terraform Modules
- Azure Resource Group Deployment
- Virtual Networking
- Network Security Groups (NSG)
- Public IP Address
- Network Interface
- Ubuntu Linux Virtual Machine
- Azure Managed Identity
- Azure Key Vault
- Azure Role-Based Access Control (RBAC)
- Common Resource Tagging
- Infrastructure Validation (`terraform fmt`, `terraform validate`)
- Provider Version Locking

---

# 📁 Directory Structure

```text
terraform/
│
├── modules/
│   ├── resource-group/
│   ├── networking/
│   ├── virtual-machine/
│   ├── managed-identity/
│   └── key-vault/
│
├── locals.tf
├── main.tf
├── network.tf
├── vm.tf
├── managed-identity.tf
├── key-vault.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── versions.tf
├── terraform.tfvars.example
└── .gitignore
```

---

# 🔄 Deployment Workflow

```text
terraform fmt -recursive
          │
          ▼
terraform validate
          │
          ▼
terraform plan
          │
          ▼
terraform apply
```

---

# 🎯 Design Principles

The Terraform implementation follows several enterprise cloud engineering principles:

- Modular Infrastructure
- Separation of Concerns
- Reusable Components
- Loose Module Coupling
- Infrastructure as Code
- Identity-based Security
- Least Privilege Access
- Consistent Resource Tagging
- Maintainable Project Structure
- Production-inspired Design