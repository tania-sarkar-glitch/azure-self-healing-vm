# 🏗️ Architecture Overview

## Project Goal

This project demonstrates an automated self-healing solution for an Azure Linux Virtual Machine running an Nginx web server.

Instead of relying on manual intervention when the web service fails, Azure monitoring and automation services work together to detect the failure and restore the application automatically.

The entire infrastructure has been implemented using both **Azure Bicep** and **HashiCorp Terraform**, demonstrating Infrastructure as Code (IaC) best practices.

---

# Architecture Diagram

![Architecture](architechture.png)

---

# Workflow

## Step 1 — Azure Linux Virtual Machine

An Azure Linux Virtual Machine hosts the Nginx web server.

```
Azure Linux VM
        │
        ▼
     Nginx Service
```

Under normal conditions, the Nginx service remains active and serves incoming HTTP requests.

---

## Step 2 — Service Failure

If the Nginx process stops unexpectedly due to a crash, configuration issue, or manual shutdown, the web application becomes unavailable.

```
Nginx Running
      │
      ▼
 Nginx Service Stops
```

This event acts as the starting point for the automated recovery workflow.

---

## Step 3 — Monitoring

Azure Monitor continuously observes the health of the virtual machine and collects logs through Log Analytics.

When the monitoring query detects that the Nginx service is no longer running, it generates an alert.

Services involved:

* Azure Monitor
* Log Analytics Workspace

---

## Step 4 — Alert Generation

The monitoring rule creates an Azure Alert whenever the service health condition is violated.

The alert can notify administrators while also triggering automated recovery.

```
Azure Monitor
       │
       ▼
   Alert Rule
```

---

## Step 5 — Recovery Options

The project demonstrates three different recovery mechanisms.

### Option 1 — Azure Logic App (Automatic)

The Alert Rule triggers an Action Group that invokes an Azure Logic App.

The Logic App executes an Azure VM Run Command to restart the Nginx service automatically.

```
Alert
   │
   ▼
Logic App
   │
   ▼
VM Run Command
```

---

### Option 2 — Manual Recovery

An administrator receives the alert notification and manually executes the restart operation.

```
Alert
   │
   ▼
Administrator
   │
   ▼
Restart Nginx
```

This represents the traditional operational approach.

---

### Option 3 — Cron Job Fallback

A Linux Cron Job running inside the virtual machine periodically checks whether the Nginx service is active.

If it detects that the service has stopped, it automatically executes:

```bash
systemctl restart nginx
```

This provides an additional recovery layer even if external monitoring is temporarily unavailable.

---

# Step 6 — Service Recovery

Regardless of which recovery path is used:

* Azure Logic App
* Manual administrator intervention
* Cron Job

the recovery process restarts the Nginx service on the virtual machine.

```
Restart Nginx
       │
       ▼
Nginx Running Again
```

The application becomes available again without requiring the virtual machine to be recreated.

---

# Components Used

| Component                   | Purpose                                              |
| --------------------------- | ---------------------------------------------------- |
| Azure Linux Virtual Machine | Hosts the application                                |
| Nginx                       | Web server being monitored                           |
| Azure Monitor               | Continuously monitors service health                 |
| Log Analytics Workspace     | Stores logs used by alert queries                    |
| Alert Rule                  | Detects service failure                              |
| Action Group                | Sends alert notifications and triggers automation    |
| Azure Logic App             | Orchestrates automatic recovery                      |
| Azure VM Run Command        | Executes restart commands on the VM                  |
| Cron Job                    | Local fallback recovery mechanism                    |
| Azure Bicep                 | Azure-native Infrastructure as Code implementation   |
| Terraform                   | Provider-based Infrastructure as Code implementation |

---

# Infrastructure as Code

The project includes two complete Infrastructure as Code implementations.

## Azure Bicep

The original deployment provisions the Azure infrastructure using Azure-native Bicep templates.

## Terraform

The Terraform implementation recreates the same infrastructure using the AzureRM provider.

Resources include:

* Resource Group
* Virtual Network
* Subnet
* Network Security Group
* Public IP Address
* Network Interface
* Azure Linux Virtual Machine

The Terraform configuration follows engineering best practices by separating infrastructure into dedicated files for networking, compute, providers, variables, outputs, and version management.

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

# Design Principles

* Infrastructure as Code
* Automated Incident Response
* Self-Healing Infrastructure
* Cloud Reliability
* Monitoring-Driven Recovery
* Reusable Infrastructure
* Operational Simplicity
* Cloud Automation
