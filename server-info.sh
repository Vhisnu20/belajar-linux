#!/bin/bash
# Show basic server info and check services

echo "===== Server Info ====="
echo "Checked at: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Hostname : $(hostname)"
echo "IP       : $(hostname -I)"
echo "Uptime   : $(uptime -p)"
echo "Kernel   : $(uname -r)"
echo "Disk     : $(df -h --output=pcent / | tail -1 | tr -d ' ') used"
echo "Memory   :"
free -h

echo "===== Service Check ====="
FAILED=0

for SERVICE in nginx ssh cron; do
    STATUS=$(systemctl is-active "$SERVICE")

    if [ "$STATUS" = "active" ]; then
        echo "OK: $SERVICE is running"
    else
        echo "WARNING: $SERVICE is $STATUS"
        FAILED=1
    fi
done

if [ "$FAILED" -eq 1 ]; then
    exit 1
fi
