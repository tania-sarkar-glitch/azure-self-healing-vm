# Monitoring Queries

This directory contains reusable Kusto Query Language (KQL) queries used by Azure Monitor Scheduled Query Alerts.

## Files

### heartbeat.kql

Detects when the VM heartbeat has stopped for more than two minutes.

### nginx-health.kql

Displays recent NGINX-related events.

### nginx-recovery.kql

Displays successful NGINX recovery events.

### nginx-failure.kql

Displays failed NGINX recovery events.

## Usage

Terraform loads the query using:

```hcl
query = file("${path.module}/queries/${var.scheduled_query_file}")
```

This keeps monitoring logic separate from Terraform code.