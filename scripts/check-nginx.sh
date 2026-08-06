#!/bin/bash

# ==========================================================
# Azure Self-Healing Platform
# NGINX Health Check
# Version: 2.0
# ==========================================================

SERVICE="nginx"
LOG_FILE="/var/log/self-healing.log"

HOSTNAME=$(hostname)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ "$HTTP_STATUS" = "200" ]; then

    echo "[$TIMESTAMP] STATUS=Healthy HOST=$HOSTNAME HTTP_STATUS=200" >> "$LOG_FILE"

    exit 0

fi

echo "[$TIMESTAMP] STATUS=Failed HOST=$HOSTNAME HTTP_STATUS=$HTTP_STATUS SERVICE=$SERVICE" >> "$LOG_FILE"

exit 1