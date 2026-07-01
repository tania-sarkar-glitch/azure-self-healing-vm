Heartbeat
| where Computer contains "selfhealvm"
| summarize LastHeartbeat = max(TimeGenerated)
| where LastHeartbeat < ago(2m)