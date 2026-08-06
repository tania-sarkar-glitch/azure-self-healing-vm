#!/bin/bash

LOG_FILE="/var/log/self-healing.log"

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "[$TIMESTAMP] Restart initiated by Azure Self-Healing Platform." >> "$LOG_FILE"

sudo systemctl restart nginx

sleep 5

if systemctl is-active --quiet nginx
then
    echo "[$TIMESTAMP] Restart successful." >> "$LOG_FILE"
    exit 0
else
    echo "[$TIMESTAMP] Restart failed." >> "$LOG_FILE"
    exit 1
fi