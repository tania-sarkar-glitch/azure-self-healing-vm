# 🏗️ Architecture Overview

This project implements an Azure-based self-healing workflow for a Linux Virtual Machine running Nginx.

## System Architecture

```mermaid
flowchart TD
    A[User / Cron / Alert Rule] --> B[Logic App<br/>HTTP Trigger]
    B --> C[Run Command]
    C --> D[Azure VM<br/>Restart Nginx]
