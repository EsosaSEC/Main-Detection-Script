#!/bin/bash

# Main script to run SOC log analysis and alerting suite
# Usage: sudo ./main.sh

# Source configuration
source ./config.sh

# Ensure alerts directory exists
mkdir -p "$ALERTS_DIR"

# Initialize alert log
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting SOC Alert Suite" >> "$ALERTS_LOG"

# Run each module
echo "Running Failed Login Monitor..."
bash failed_login.sh >> "$ALERTS_LOG" 2>&1

echo "Running Privilege Escalation Detector..."
bash priv_escalation.sh >> "$ALERTS_LOG" 2>&1

echo "Running Network Connection Scanner..."
bash network_scan.sh >> "$ALERTS_LOG" 2>&1

echo "Running Process Monitor..."
bash process_monitor.sh >> "$ALERTS_LOG" 2>&1

# Check if new alerts were generated
if grep -q "ALERT" "$ALERTS_LOG"; then
    echo "New alerts found. Check $ALERTS_LOG for details."
    # Optional: Send email notification
    if [ -n "$EMAIL_TO" ]; then
        cat "$ALERTS_LOG" | mail -s "SOC Alerts: $(date '+%Y-%m-%d %H:%M:%S')" "$EMAIL_TO"
    fi
else
    echo "No new alerts detected."
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] SOC Alert Suite completed" >> "$ALERTS_LOG"
