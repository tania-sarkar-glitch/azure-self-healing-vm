# 🚀 Azure Self-Healing VM Platform

> **A production-inspired Azure platform that detects Nginx failures, automatically recovers the service, and validates the recovery.**

[![Microsoft Azure](https://img.shields.io/badge/Microsoft_Azure-Cloud-0078D4?logo=microsoftazure\&logoColor=white)](https://azure.microsoft.com/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-844FBA?logo=terraform\&logoColor=white)](https://www.terraform.io/)
[![Azure Bicep](https://img.shields.io/badge/Azure_Bicep-IaC-4B53BC?logo=microsoftazure\&logoColor=white)](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-E95420?logo=ubuntu\&logoColor=white)](https://ubuntu.com/)
[![Nginx](https://img.shields.io/badge/Nginx-Web_Server-009639?logo=nginx\&logoColor=white)](https://nginx.org/)
[![Azure Monitor](https://img.shields.io/badge/Azure_Monitor-Observability-0078D4?logo=microsoftazure\&logoColor=white)](https://azure.microsoft.com/products/monitor)
[![Log Analytics](https://img.shields.io/badge/Log_Analytics-Observability-0078D4?logo=microsoftazure\&logoColor=white)](https://azure.microsoft.com/products/monitor)
[![Bash](https://img.shields.io/badge/Bash-Automation-4EAA25?logo=gnubash\&logoColor=white)](https://www.gnu.org/software/bash/)
[![Managed Identity](https://img.shields.io/badge/Azure-Managed_Identity-0078D4?logo=microsoftazure\&logoColor=white)](https://learn.microsoft.com/azure/active-directory/managed-identities-azure-resources/overview)
[![Key Vault](https://img.shields.io/badge/Azure-Key_Vault-0078D4?logo=microsoftazure\&logoColor=white)](https://azure.microsoft.com/products/key-vault)
[![RBAC](https://img.shields.io/badge/Azure-RBAC-0078D4?logo=microsoftazure\&logoColor=white)](https://learn.microsoft.com/azure/role-based-access-control/overview)

> 🧪 **Project status:** Infrastructure was deployed, tested, documented, and destroyed as part of a cost-conscious build → validate → document → destroy lifecycle. The repository contains the IaC and evidence needed to reproduce the environment.

---

## 🎯 What is this?

Cloud infrastructure should not only **detect failures**. It should be able to **respond to them and verify that the recovery worked**.

This project demonstrates a self-healing Azure Linux VM running Nginx. A system-level Cron job executes a Bash health-check script every minute. The script checks the Nginx endpoint locally, restarts the service when the health check fails, and performs a second HTTP check to verify recovery.

Beyond the self-healing mechanism, the project builds the surrounding Azure platform needed to run it reliably: networking, identity, security, monitoring, governance, and automated infrastructure deployment.

### 🔄 The core idea

```text
┌──────────────────┐
│   Nginx Service  │
└────────┬─────────┘
         │
         ▼
┌──────────────────────────┐
│ Cron → Bash Health Check │
└────────┬─────────────────┘
         │
         ▼
   HTTP Health Check
      / localhost
         │
    ┌────┴─────┐
    │          │
   200       Failure
    │          │
    ▼          ▼
 Healthy   Restart Nginx
               │
               ▼
        HTTP Health Check
               │
          ┌────┴─────┐
          │          │
         200       Failure
          │          │
          ▼          ▼
       Recovered  RecoveryFailed
```
# 🏗️ Architecture

![Architecture Diagram](docs/Architechture/architechture.png)

The platform combines three intentionally separate layers:

| Layer | Implementation | Purpose |
|---|---|---|
| 🔄 Recovery | Cron → Bash → systemd → Nginx | Local service recovery |
| 📊 Observability | AMA → DCR → Log Analytics | VM telemetry and heartbeat |
| 🏗️ Platform | Terraform → Landing Zone → VM | Reproducible Azure infrastructure |

The platform also includes Hub-Spoke networking, Managed Identity, RBAC, Key Vault, Azure Policy, and remote Terraform state.

### 🧩 Platform Foundations

| Area | Implementation |
|---|---|
| 🌐 Networking | Hub-Spoke VNets, subnets, NSGs, peering, Private DNS |
| 🆔 Identity | User Assigned Managed Identity + Azure RBAC |
| 🔐 Security | Key Vault + Azure Policy |
| 💾 Terraform State | Azure Storage remote backend |
| ⚙️ DevOps | GitHub Actions + OIDC |
> **Important:** Azure Monitor provides the observability and alerting layer. The current Nginx recovery mechanism is **local Linux automation**, not an Azure Monitor or Logic Apps remediation workflow.

>  **Observability:** Azure Monitor Agent sends VM telemetry through a Data Collection Rule (DCR) to Log Analytics, where heartbeat data can be queried and used by alert rules.

Design principle: Recovery and observability are intentionally independent. Linux handles Nginx recovery locally, while Azure Monitor provides platform-level visibility and alerting.


➡️ **[architecture.md](docs/Architechture/architechture.md)**

---
# ☁️ Infrastructure as Code

Terraform is now the primary implementation; Bicep remains as historical evidence of the project's evolution.

| Component                 | Bicep | Terraform |
| ------------------------- | :---: | :-------: |
| Resource Group            |   ✅   |     ✅     |
| Virtual Network & Subnets |   ✅   |     ✅     |
| Network Security Group    |   ✅   |     ✅     |
| Public IP & NIC           |   ✅   |     ✅     |
| Ubuntu Linux VM           |   ✅   |     ✅     |

### 🧩 Terraform Layers

The Terraform configuration is organized around reusable modules with clear responsibilities:

| Layer           | Purpose                                                     |
| --------------- | ----------------------------------------------------------- |
| `bootstrap/`    | Creates remote Terraform state infrastructure               |
| `landing-zone/` | Builds networking, DNS, identity and governance foundations |
| `self-healing/` | Deploys the VM, Nginx recovery, monitoring and alerting     |
| `modules/`      | Reusable Terraform building blocks                          |


This structure keeps infrastructure components **reusable, isolated, and easier to maintain**.

### 🔧 Terraform Workflow

Each Terraform layer follows the standard workflow:

```text
terraform init
      ↓
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply

The configuration was validated successfully with `terraform validate`.

> **Prerequisite:** Deployment requires an authenticated Azure CLI session and an active Azure subscription.

---

# 🛠️ Technology Stack

| Layer                           | Technologies                                                   |
| -----------------------------   | -------------------------------------------------------------- |
| ☁️ **Cloud**                    | Microsoft Azure                                                |
| 🏗️ **IaC**                      | Terraform, Azure Bicep                                         |
| 💻 **Compute**                  | Azure Linux VM, Ubuntu 22.04 LTS, Nginx                        |
| 🌐 **Networking**               | VNet, Subnets, NSGs, Public IP, NIC, VNet Peering, Private DNS |
| 🔄 **Self-Healing**             | Bash, Linux Cron, systemd                                      |
| 📊 **Observability**            | Azure Monitor Agent, Data Collection Rules, Log Analytics      |
| 🚨 **Alerting**                 | Scheduled Query Rules, Action Groups                           |
| 🛡️ **Identity & Governance**    | Managed Identity, Azure RBAC, Key Vault, Azure Policy          |
| ⚙️ **DevOps**                   | Git, GitHub Actions, Azure OIDC, Terraform workflows           |
| 💻 **Development**              | GitHub Codespaces, Azure CLI                                   |

# 📁 Repository Structure

```text
.
├── .devcontainer
│   └── devcontainer.json
├── .github
│   ├── CODEOWNERS
│   ├── ISSUE_TEMPLATE
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   ├── dependabot.yml
│   ├── pull_request_template.md
│   └── workflows
│       └── terraform.yml
├── LICENSE
├── README.md
├── docs
│   ├── Architechture
│   │   └── remote-state.md
│   ├── alert-rule.md
│   ├── screenshots
│   ├── security
│   │   └── oidc-authentication.md
│   └── video-links.md
├── infra
│   └── main.bicep
├── logic-app
│   └── self-heal-workflow.json
├── scripts
│   ├── check-nginx.sh
│   ├── cronjob.sh
│   ├── payload.json
│   ├── restart-nginx.sh
│   └── trigger.sh
└── terraform
    ├── .gitignore
    ├── .tflint.hcl
    ├── README.md
    ├── bootstrap
    │   ├── environments
    │   │   └── dev.tfvars
    │   ├── locals.tf
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── provider.tf
    │   ├── variables.tf
    │   └── versions.tf
    ├── landing-zone
    │   ├── backend.tf
    │   ├── environments
    │   │   ├── dev.tfvars
    │   │   ├── prod.tfvars
    │   │   └── test.tfvars
    │   ├── locals.tf
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── private-dns.tf
    │   ├── providers.tf
    │   ├── variables.tf
    │   └── versions.tf
    ├── modules
    │   ├── action-group
    │   ├── azure-monitor-agent
    │   ├── diagnostic-settings
    │   ├── hub-network
    │   ├── key-vault
    │   ├── log-analytics
    │   ├── managed-identity
    │   ├── metric-alert
    │   ├── networking
    │   ├── policy
    │   │   ├── README.md
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── private-dns
    │   ├── private-endpoint
    │   ├── resource-group
    │   ├── scheduled-query-alert
    │   ├── spoke-network
    │   ├── terraform-backend
    │   ├── virtual-machine
    │   └── vnet-peering
    ├── self-healing
    │   ├── action-group.tf
    │   ├── azure-monitor-agent.tf
    │   ├── backend
    │   │   ├── backend.hcl.example
    │   │   └── remote-state.tf
    │   ├── backend.tf
    │   ├── custom-data
    │   │   └── cloud-init.yaml
    │   ├── diagnostic-settings.tf
    │   ├── environments
    │   │   ├── dev.tfvars
    │   │   ├── prod.tfvars
    │   │   └── test.tfvars
    │   ├── key-vault.tf
    │   ├── locals.tf
    │   ├── log-analytics.tf
    │   ├── main.tf
    │   ├── managed-identity.tf
    │   ├── metric-alert.tf
    │   ├── network.tf
    │   ├── outputs.tf
    │   ├── policy.tf
    │   ├── provider.tf
    │   ├── queries
    │   │   ├── README.md
    │   │   ├── heartbeat.kql
    │   │   ├── nginx-availability.kql
    │   │   ├── nginx-failure.kql
    │   │   ├── nginx-health.kql
    │   │   └── nginx-recovery.kql
    │   ├── rbac.tf
    │   ├── scheduled-query-alert.tf
    │   ├── variables.tf
    │   ├── versions.tf
    │   └── vm.tf
    ├── terraform.tfvars.backup
    └── terraform.tfvars.example
```

### 🧭 Repository Layers

| Directory                 | Purpose                                                             |
| ------------------------- | ------------------------------------------------------------------- |
| `terraform/bootstrap/`    | Creates the Azure Storage resources used for Terraform remote state |
| `terraform/landing-zone/` | Hub-Spoke networking, DNS, identity and governance foundations      |
| `terraform/self-healing/` | VM, Nginx self-healing, monitoring and related resources            |
| `terraform/modules/`      | Reusable Terraform modules                                          |
| `.github/workflows/`      | GitHub Actions / Terraform CI/CD workflow                           |
| `infra/`                  | Original Bicep implementation                                       |
| `logic-app/`              | Historical Logic Apps self-healing prototype                        |
| `scripts/`                | Supporting and historical scripts                                   |
| `docs/`                   | Architecture, screenshots and supporting documentation              |

> 🏛️ **Historical files are intentionally retained.** `infra/main.bicep` and `logic-app/self-heal-workflow.json` document the project's original Bicep + Logic Apps implementation and are not the current self-healing engine.

---

# 🚀 Quick Start

The repository is designed to be reproducible through Terraform.

### 1. Clone the repository

```bash
git clone https://github.com/tania-sarkar-glitch/azure-self-healing-vm.git
cd azure-self-healing-vm
```

### 2. Validate the Terraform configuration

Terraform is organized into three deployment layers:

```text
terraform/bootstrap/
terraform/landing-zone/
terraform/self-healing/

Run the standard Terraform validation workflow from each layer:

```bash
cd terraform/<layer>

terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

### 3. Deploy

The project follows a staged deployment model:

```text
Bootstrap
   ↓
Remote State
   ↓
Landing Zone
   ↓
Self-Healing Infrastructure
```

Deployment requires:

* Azure CLI
* An authenticated Azure session
* An active Azure subscription
* Terraform

```bash
az login
```

> 💡 The Azure environment used for project validation was subsequently destroyed to control ongoing cloud costs. The repository remains as the reproducible IaC artifact.

---

# 📚 Documentation

Supporting documentation is kept intentionally focused rather than duplicating the README.

| Resource                   | Purpose                                        |
| -------------------------- | ---------------------------------------------- |
| 🏗️ **Architecture**       | Architecture diagrams and design documentation |
| 🚨 **Alert Rule**          | Scheduled Query Rule and Action Group details  |
| 📸 **Screenshots**         | Selected Azure and terminal evidence           |
| 🎥 **Video Demonstration** | Project walkthrough and validation evidence    |

More detailed documentation can be added under `docs/` as individual areas of the platform mature.

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

| Area               | Skills                                                                            |
| ------------------ | --------------------------------------------------------------------------------- |
| ☁️ **Azure**       | VMs, VNet, Hub-Spoke, NSGs, Private DNS, Landing Zone, Monitor, Log Analytics     |
| 🏗️ **IaC**        | Terraform, Bicep, reusable modules, remote state, multi-environment configuration |
| 🔄 **Automation**  | Bash, Linux, Cron, systemd, Nginx self-healing                                    |
| ⚙️ **DevOps**      | GitHub Actions, Azure OIDC, CI/CD, Terraform workflows                            |
| 🛡️ **Security**   | Managed Identity, RBAC, Key Vault, Azure Policy, private networking, OIDC               |
| 📊 **Reliability** | Health checks, automated recovery, monitoring, alerting, troubleshooting          |
------

# 🚀 Future Roadmap

### 🐳 Docker

* Containerize Nginx
* Health checks & restart policies
* Docker Compose

### ☸️ Kubernetes / AKS

* Deployments & Services
* Liveness / Readiness probes
* HPA
* AKS & ACR
* Workload Identity

### ⚙️ Platform Engineering

* Build reusable platform patterns and golden paths
* Strengthen policy-as-code and environment governance
* Expand observability and cost governance

---

## 📖 Key Lessons Learned

- Local service recovery and cloud observability solve different problems and can be designed independently.
- Terraform modules and layered deployments make infrastructure easier to reproduce and maintain.
- Managed Identity and OIDC remove the need for long-lived Azure credentials.
- Monitoring integrations need to be validated end-to-end, not just declared in Terraform.
- Cloud environments can be treated as disposable during development, allowing infrastructure to be validated without maintaining unnecessary ongoing costs.

---

# 🏗️ Engineering Principles

**IaC** • **Automation** • **Least Privilege** • **Identity over Credentials** • **Observability** • **Self-Healing** • **Reusable Infrastructure** • **Governance** • **Cost Awareness**

---

# 📌 Project Status

> 🧪 **Validated and decommissioned:** The Azure environment was deployed, tested, documented, and intentionally destroyed after validation. The repository preserves the Terraform implementation, automation, CI/CD configuration, and supporting evidence needed to reproduce it.

**Build → Validate → Document → Destroy**

---

# 📦 Project Evolution

| Version  | Evolution                                        |
| -------- | ------------------------------------------------ |
| **v1.0** | Bicep + Logic App prototype                      |
| **v2.0** | Terraform migration                              |
| **v2.1** | Modular Terraform + Remote State                 |
| **v2.2** | Landing Zone + Hub-Spoke + Identity + Governance |
| **v2.3** | AMA + DCR + Log Analytics                        |
| **v2.4** | Cron + Bash + systemd self-healing               |
| **v2.5** | Multi-environment + GitHub Actions + OIDC        |
| **Next** | Docker → Kubernetes → AKS                        |

---

# 👩‍💻 Author

**Tania Sarkar**

Middleware Engineer → Azure Cloud → Infrastructure as Code → DevOps → Platform Engineering

**Core:** Azure • Terraform • Bicep • Linux • Automation • Cloud Infrastructure

If you found this project helpful, feel free to ⭐ the repository or connect with me to discuss Cloud Engineering, Infrastructure as Code, Azure, Terraform, DevOps, or Site Reliability Engineering.
