# 🚀 Azure Self-Healing VM Platform

> Enterprise-grade Azure Infrastructure as Code project demonstrating automated VM recovery using Azure Monitor, Azure Logic Apps, Azure Bicep, and modular Terraform following cloud engineering best practices.

![Terraform](https://img.shields.io/badge/Terraform-1.13-844FBA?logo=terraform\&logoColor=white)
![Microsoft Azure](https://img.shields.io/badge/Microsoft%20Azure-Cloud-0078D4?logo=microsoftazure\&logoColor=white)
![Bicep](https://img.shields.io/badge/Bicep-Infrastructure%20as%20Code-4B53BC)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-E95420?logo=ubuntu\&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-Web%20Server-009639?logo=nginx\&logoColor=white)
![Azure Monitor](https://img.shields.io/badge/Azure-Monitor-0078D4)
![Logic Apps](https://img.shields.io/badge/Azure-Logic%20Apps-0066FF)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?logo=github)

> ### 🚀> **A production-inspired Azure Cloud Engineering project demonstrating Infrastructure as Code, modular Terraform architecture, monitoring, alerting, identity-based security, and automated recovery of an Nginx web server using Azure native services.**.

---

## 📌 Overview

Modern cloud environments should recover automatically from service failures instead of relying solely on manual intervention.

This project demonstrates a **self-healing Azure Linux Virtual Machine** running **Nginx**, where Azure monitoring services continuously monitor application health and automatically initiate recovery whenever the service becomes unavailable.

The infrastructure has been implemented using **two Infrastructure as Code (IaC) technologies**:

* **Azure Bicep** (Azure-native IaC)
* **HashiCorp Terraform** (Provider-based IaC)

The Terraform implementation follows a modular Infrastructure as Code architecture using reusable modules for Resource Groups, Networking, Virtual Machines, Managed Identity, and Azure Key Vault. Module outputs are used to connect components while maintaining loose coupling and reusability following enterprise cloud engineering practices.

This repository showcases cloud automation, Infrastructure as Code, monitoring, alerting, and recovery workflows inspired by real production environments.

---

# 🏗️ Architecture

![Architecture Diagram](docs/Architechture/architechture.png)

The solution follows a production-inspired Azure architecture where monitoring services continuously observe the virtual machine and automatically trigger recovery when an application failure is detected.

### Architecture Highlights

• Terraform Modules
• Managed Identity
• Key Vault
• RBAC
• Azure Monitor
• Log Analytics
• Logic Apps
• Linux VM
• Networking
• Bicep
• Validation

➡️ **[architecture.md](docs/Architechture/architechture.md)**

---

# ✨ Project Highlights

| Feature                        | Status |
| ------------------------------ | :----: |
| Modular Terraform Architecture |    ✅   |
| Azure Bicep Deployment         |    ✅   |
| Azure Linux VM                 |    ✅   |
| Azure Networking               |    ✅   |
| Azure Monitor                  |    ✅   |
| Log Analytics                  |    ✅   |
| Azure Key Vault                |    ✅   |
| Managed Identity               |    ✅   |
| RBAC                           |    ✅   |
| Logic App Self-Healing         |    ✅   |
| Infrastructure Validation      |    ✅   |

---

# ☁️ Infrastructure as Code

This project demonstrates the same Azure infrastructure using both Azure-native and cloud-agnostic Infrastructure as Code approaches.

| Azure Resource               | Bicep | Terraform |
| ---------------------------- | :---: | :-------: |
| Resource Group               |   ✅   |     ✅     |
| Virtual Network              |   ✅   |     ✅     |
| Subnet                       |   ✅   |     ✅     |
| Network Security Group       |   ✅   |     ✅     |
| Public IP Address            |   ✅   |     ✅     |
| Network Interface            |   ✅   |     ✅     |
| Ubuntu Linux Virtual Machine |   ✅   |     ✅     |

## Terraform Highlights

The Terraform implementation follows engineering best practices by separating infrastructure into dedicated configuration files.

## Terraform Module Architecture

The Terraform implementation is organized into reusable modules. The root module orchestrates each infrastructure component by passing outputs between modules, allowing every module to have a single responsibility.

![Terraform Module Dependency Diagram](docs/Architechture/Terraform%20Module%20Dependency%20Diagram.png)

### Module Responsibilities

| Module | Responsibility |
|----------|---------------|
| Resource Group | Creates the Azure Resource Group |
| Networking | Creates VNet, Subnet, NSG, Public IP and NIC |
| Virtual Machine | Deploys the Ubuntu Linux VM |
| Managed Identity | Creates a User Assigned Managed Identity |
| Key Vault | Creates Azure Key Vault |
| Root Module | Connects all modules together |

# 🚀 Deployment Flow

![Deployment Flow Diagram](docs/Architecture/deployment-flow.png)

The deployment follows Terraform's dependency graph, automatically provisioning infrastructure in the correct order while maintaining module isolation and reusable architecture.

### Terraform Workflow

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

### Validation

The Terraform configuration has been successfully validated.

```bash
terraform init
terraform fmt -recursive
terraform validate
```

Validation Result:

```text
Success! The configuration is valid.
```

> **Note:** Infrastructure deployment requires an authenticated Azure CLI session and an active Azure subscription.

---

# 🛠️ Technology Stack

### ☁️ Cloud

* Microsoft Azure

### 🏗️ Infrastructure as Code

| Tool      | Responsibility                                                 |
| --------- | -------------------------------------------------------------- |
| Bicep     | Azure-native deployment for the original self-healing VM stack |
| Terraform | Modular infrastructure, networking, identity, Key Vault, RBAC  |


### 💻 Compute

* Azure Linux Virtual Machine
* Ubuntu 22.04 LTS
* Nginx

### 🌐 Networking

* Virtual Network
* Subnet
* Network Security Group
* Public IP
* Network Interface

### 📊 Monitoring

* Azure Monitor
* Log Analytics Workspace
* Alert Rules
* Action Groups

### ⚙️ Automation

* Azure Logic Apps
* Azure VM Run Command
* Bash Scripts
* Linux Cron Jobs

### 🛠️ Development

* Git
* GitHub
* GitHub Codespaces

---

## Terraform Modules

| Module | Purpose |
|---------|---------|
| Resource Group | Deploys Azure Resource Groups |
| Networking | Deploys networking components |
| Virtual Machine | Deploys Ubuntu Linux VM |
| Managed Identity | Creates a User Assigned Managed Identity |
| Key Vault | Stores application secrets securely |

---

# 📁 Repository Structure

```text
.
├── infra/
│   └── main.bicep
├── terraform/
│   ├── modules/
│   │   ├── resource-group/
│   │   ├── networking/
│   │   ├── virtual-machine/
│   │   ├── managed-identity/
│   │   └── key-vault/
│   ├── locals.tf
│   ├── main.tf
│   ├── network.tf
│   ├── vm.tf
│   ├── managed-identity.tf
│   ├── key-vault.tf
│   ├── outputs.tf
│   ├── variables.tf
│   ├── provider.tf
│   └── versions.tf
├── logic-app/
│   └── self-heal-workflow.json
├── scripts/
│   ├── cronjob.sh
│   └── trigger.sh
├── docs/
│   ├── Architecture/
│   │   ├── architecture.md
│   │   ├── architecture.png
│   │   ├── Terraform Module Dependency Diagram.png
│   │   └── deployment-flow.png
│   ├── screenshots/
│   ├── alert-rule.md
│   └── video-links.md
├── .github/
└── README.md
```
---

# 🚀 Quick Start

Clone the repository and validate the Terraform configuration locally.

```bash
git clone https://github.com/tania-sarkar-glitch/azure-self-healing-vm.git

cd azure-self-healing-vm/terraform

terraform init

terraform fmt -recursive

terraform validate
```

To generate an execution plan:

```bash
terraform plan
```

To deploy the infrastructure:

```bash
terraform apply
```

> **Note:** Running `terraform plan` or `terraform apply` requires:
>
> - Azure CLI installed
> - An authenticated Azure session (`az login`)
> - An active Azure subscription

---

# 📚 Documentation

Additional project documentation is available below.

| Document | Description |
|----------|-------------|
| Architecture Guide | Complete solution architecture and design decisions |
| Alert Rule | Azure Monitor configuration |
| Video Demonstration | Project walkthrough |                                                        |

---

# 📸 Project Gallery

### ☁️ Azure Infrastructure

![VM](docs/screenshots/01-vm.png)

Shows the deployed Ubuntu Linux Virtual Machine.

---

### 📊 Monitoring

![Monitor](docs/screenshots/04-log-analytics-workspace.png)

Azure Monitor continuously checks the health of the Nginx service.

---

### 🚨 Alert Detection

![Alert](docs/screenshots/06-alert-rule.png)

An alert is generated when the monitoring condition is met.

---

### ⚙️ Automated Recovery

![Logic App](docs/screenshots/08-logic-app-flow.png)

Azure Logic App executes VM Run Command to restart Nginx.

---

### ✅ Recovery Completed

![Activity](docs/screenshots/12-activity-log.png)

The service is restored and Azure records the successful recovery.

---

### 🌍 Terraform Configuration Validation

![Terraform Validation](docs/screenshots/16-terraform.png)

The Terraform implementation was successfully initialized, formatted, and validated using the standard Terraform workflow before deployment planning.

```bash
terraform init
terraform fmt -recursive
terraform validate
```

Validation Result:

```text
Success! The configuration is valid.
```

> Additional screenshots are available in the **docs/screenshots/** folder.

---

# 💼 Skills Demonstrated

### ☁️ Azure Cloud Engineering

* Microsoft Azure
* Azure Virtual Machines (Linux)
* Azure Virtual Network (VNet)
* Azure Network Security Groups (NSG)
* Azure Monitor
* Azure Log Analytics
* Azure Logic Apps
* Azure Key Vault
* Azure Managed Identity
* Azure Role-Based Access Control (RBAC)

---

### 🏗️ Infrastructure as Code (IaC)

* Azure Bicep
* Terraform
* Modular Terraform Architecture
* AzureRM Provider
* Reusable Terraform Modules
* Variables & Outputs
* Infrastructure Validation (`terraform fmt`, `validate`, `plan`)
* Declarative Infrastructure

---

### 🔄 DevOps & Automation

* Infrastructure Automation
* Git
* GitHub
* GitHub Codespaces
* Linux Administration
* Bash Scripting

---

### 🛡️ Security & Governance

* Identity-based Authentication
* Least Privilege Access (RBAC)
* Azure Key Vault Secrets Management
* Managed Identity
* Common Resource Tagging Strategy

---

### 📈 Site Reliability Engineering (SRE)

* Monitoring
* Alerting
* Automated Recovery
* Self-Healing Infrastructure
* Operational Resilience

---

# 🚀 Future Improvements

* Remote Terraform State using Azure Storage backend with state locking
* GitHub Actions CI/CD Pipeline
* Multi-Environment Deployments
* Azure Policy
* Private Endpoints
* Hub-Spoke Network
* Remote State
* GitHub Actions OIDC
* Multi-environment Deployment
* AKS
* Azure Landing Zone

---

# 📖 Lessons Learned

- Infrastructure as Code using both Azure Bicep and Terraform
- Modular Terraform design with reusable components
- Module outputs and dependency wiring
- Managed Identity and RBAC for secure access
- Common tagging for governance
- Monitoring-driven recovery workflows
- Designing reusable Terraform modules with single responsibilities
- Understanding Azure Resource IDs, Principal IDs, and Client IDs
- Building Infrastructure as Code that is maintainable and scalable

---

# 🏗️ Enterprise Design Principles

This project was designed using cloud engineering principles commonly found in enterprise Azure environments.

- Modular Infrastructure as Code
- Separation of Concerns
- Least Privilege Access (RBAC)
- Identity-based Authentication
- Reusable Terraform Modules
- Infrastructure Validation
- Consistent Resource Tagging
- Monitoring-first Operations

---

# 📌 Project Status

> Azure resources were intentionally decommissioned after successful validation and testing to avoid unnecessary cloud costs.

The Infrastructure as Code templates, Terraform implementation, automation workflows, architecture documentation, scripts, screenshots, and deployment evidence remain available within this repository.

---

# 📦 Release History

| Version | Highlights |
|----------|------------|
| v1.0 | Initial Azure Self-Healing VM using Azure Bicep |
| v2.0 | Terraform implementation |
| v2.0.1 | Project restructuring and documentation improvements |
| v2.0.2 | Modular Terraform architecture, Managed Identity, Azure Key Vault, RBAC, enterprise documentation, and architecture diagrams |

---

# 👩‍💻 Author

**Tania Sarkar**

Middleware Engineer • Azure Cloud • Infrastructure as Code • Terraform • Bicep • DevOps • Cloud Automation • Site Reliability Engineering

If you found this project helpful, feel free to ⭐ the repository or connect with me to discuss Cloud Engineering, Infrastructure as Code, Azure, Terraform, DevOps, or Site Reliability Engineering.
