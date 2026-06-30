# 🏗️ Architecture Overview

## Document Information

| Item                   | Details                                                    |
| ---------------------- | ---------------------------------------------------------- |
| Project                | Azure Self-Healing VM                                      |
| Cloud Platform         | Microsoft Azure                                            |
| Infrastructure as Code | Azure Bicep & Terraform                                    |
| Architecture Pattern   | Monitoring-Driven Self-Healing Infrastructure              |
| Purpose                | Automated Detection and Recovery of Nginx Service Failures |

---

# Project Goal

The objective of this project is to design a resilient Azure infrastructure capable of automatically recovering from application-level failures.

An Ubuntu Linux Virtual Machine hosts an Nginx web server. Rather than relying solely on manual intervention, Azure Monitor continuously evaluates the application's health. When the service becomes unavailable, Azure automation services initiate recovery workflows to restore application availability with minimal downtime.

To demonstrate Infrastructure as Code (IaC) best practices, the complete Azure environment has been implemented using both **Azure Bicep** and **HashiCorp Terraform**.

---

# Architecture Objectives

The architecture was designed with the following objectives:

* Demonstrate Infrastructure as Code using Azure Bicep and Terraform
* Implement monitoring-driven incident detection
* Automate recovery of failed application services
* Minimize operational downtime
* Reduce manual intervention
* Demonstrate cloud automation using Azure native services
* Follow reusable and maintainable infrastructure design principles

---

# Architecture Diagram

![Architecture](architechture.png)

---

# End-to-End Recovery Workflow

## Step 1 – Application Hosting

An Azure Linux Virtual Machine hosts an Nginx web server responsible for serving HTTP requests.

```text
Azure Linux Virtual Machine
            │
            ▼
       Nginx Service
```

During normal operation, the service remains healthy and continuously serves client requests.

---

## Step 2 – Failure Detection

If the Nginx service stops unexpectedly due to a crash, configuration issue, or manual shutdown, the web application becomes unavailable.

```text
Nginx Running
      │
      ▼
Nginx Service Stops
```

This event initiates the automated recovery workflow.

---

## Step 3 – Continuous Monitoring

Azure Monitor continuously evaluates application health using logs collected by Log Analytics Workspace.

When the configured monitoring condition evaluates to true, Azure Monitor generates an alert indicating that the Nginx service is no longer running.

---

## Step 4 – Alert Generation

The Alert Rule is triggered whenever the monitoring query detects a service failure.

The alert can simultaneously:

* Notify administrators
* Trigger Azure automation workflows

```text
Azure Monitor
      │
      ▼
 Alert Rule
```

---

## Step 5 – Recovery Mechanisms

The architecture demonstrates three different recovery approaches.

### Option 1 – Automated Recovery (Logic App)

The Alert Rule invokes an Action Group, which triggers an Azure Logic App.

The Logic App executes Azure VM Run Command to restart the Nginx service automatically.

```text
Alert Rule
      │
      ▼
 Action Group
      │
      ▼
 Azure Logic App
      │
      ▼
 VM Run Command
      │
      ▼
Restart Nginx
```

This represents the primary self-healing workflow.

---

### Option 2 – Manual Recovery

The Alert Rule notifies an administrator, who manually restarts the service.

```text
Alert Rule
      │
      ▼
Administrator
      │
      ▼
Restart Nginx
```

This provides operational control whenever manual investigation is preferred.

---

### Option 3 – Local Cron Job Recovery

A Linux Cron Job running inside the virtual machine periodically checks whether Nginx is active.

If the service is found to be stopped, the Cron Job executes:

```bash
systemctl restart nginx
```

This provides a fallback recovery mechanism independent of Azure monitoring.

---

## Step 6 – Service Restoration

Regardless of the recovery path, the Nginx service is restarted and resumes serving incoming traffic.

```text
Restart Nginx
      │
      ▼
Nginx Running
```

Application availability is restored without rebuilding or replacing the virtual machine.

---

# Architecture Components

| Component                   | Responsibility                                          |
| --------------------------- | ------------------------------------------------------- |
| Azure Linux Virtual Machine | Hosts the application workload                          |
| Nginx                       | Web service monitored for availability                  |
| Azure Monitor               | Continuously evaluates application health               |
| Log Analytics Workspace     | Stores monitoring logs and query data                   |
| Alert Rule                  | Detects service failure conditions                      |
| Action Group                | Connects alerts to notification and automation services |
| Azure Logic App             | Coordinates automated recovery                          |
| Azure VM Run Command        | Executes restart commands within the VM                 |
| Linux Cron Job              | Provides local fallback recovery                        |
| Azure Bicep                 | Azure-native Infrastructure as Code implementation      |
| Terraform                   | Provider-based Infrastructure as Code implementation    |

---

# Infrastructure Implementation

The Azure infrastructure has been implemented using two Infrastructure as Code technologies.

## Azure Bicep

The original implementation provisions Azure infrastructure using Azure-native Bicep templates.

This deployment creates:

* Resource Group
* Virtual Network
* Subnet
* Network Security Group
* Public IP Address
* Network Interface
* Ubuntu Linux Virtual Machine

---

## Terraform

The same infrastructure has been recreated using the AzureRM Terraform Provider.

The Terraform implementation follows a modular file organization by separating infrastructure into logical configuration files.

```text
terraform/

├── provider.tf
├── versions.tf
├── main.tf
├── network.tf
├── vm.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars.example
```

Each file has a single responsibility, improving readability, maintainability, and scalability.

---

# Design Decisions

## Why Azure Bicep?

Azure Bicep provides a concise Azure-native language that simplifies ARM template development while maintaining tight integration with Azure Resource Manager.

---

## Why Terraform?

Terraform enables provider-independent Infrastructure as Code and follows a declarative approach that is widely adopted across multi-cloud environments.

---

## Why Ubuntu Linux?

Ubuntu is lightweight, production-ready, and one of the most commonly deployed Linux distributions in Azure environments.

---

## Why Nginx?

Nginx provides a simple, lightweight web server that is ideal for demonstrating monitoring and automated recovery scenarios.

---

## Why Azure Logic Apps?

Logic Apps provide a serverless orchestration platform capable of integrating monitoring events with Azure automation workflows.

---

## Why Azure VM Run Command?

VM Run Command allows secure remote execution of commands without requiring direct SSH access to the virtual machine.

---

## Why Cron Job?

The Cron Job provides an additional recovery layer that operates independently of Azure monitoring services, increasing overall resilience.

---

# Failure Scenarios

### Scenario 1 – Application Failure

```text
Nginx Stops
      │
      ▼
Azure Monitor Detects Failure
      │
      ▼
Alert Rule
      │
      ▼
Logic App
      │
      ▼
Restart Nginx
```

---

### Scenario 2 – Manual Operational Recovery

```text
Alert Rule
      │
      ▼
Administrator
      │
      ▼
Restart Service
```

---

### Scenario 3 – Monitoring Unavailable

```text
Azure Monitoring Unavailable
          │
          ▼
Linux Cron Job
          │
          ▼
Restart Nginx
```

---

# High-Level Architecture Flow

```text
Azure Linux VM
       │
       ▼
Nginx Running
       │
       ▼
Nginx Stops
       │
       ▼
Azure Monitor + Log Analytics
       │
       ▼
Alert Rule
       │
 ┌─────┼───────────────┐
 │     │               │
 ▼     ▼               ▼
Logic App   Administrator   Cron Job
 │            │             │
 └────────────┼─────────────┘
              ▼
       Restart Nginx
              │
              ▼
       Nginx Running
```

---

# Architecture Principles

The solution has been designed around the following engineering principles:

* Infrastructure as Code
* Declarative Infrastructure
* Monitoring-Driven Operations
* Automated Incident Response
* Self-Healing Infrastructure
* Operational Simplicity
* Reusability
* Maintainability
* Cloud Reliability
* Separation of Responsibilities

---

# Conclusion

This project demonstrates how Azure monitoring and automation services can be combined with Infrastructure as Code to build a resilient, self-healing cloud environment.

By implementing the same infrastructure using both Azure Bicep and Terraform, the solution showcases Azure-native deployment techniques alongside provider-based Infrastructure as Code while emphasizing automation, operational reliability, and maintainable cloud architecture.
