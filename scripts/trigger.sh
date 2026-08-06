#!/bin/bash

echo "Triggering Azure Self-Healing Logic App..."

curl -X POST "YOUR_LOGIC_APP_HTTP_TRIGGER_URL" \
  -H "Content-Type: application/json" \
  -d @payload.json

echo
echo "Request sent."