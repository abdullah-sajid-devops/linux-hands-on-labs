#!/bin/bash
echo "==========================="
echo "    SYSTEM AUDIT REPORT    "
echo "==========================="
echo "Date: $(date)"
echo "Free Memory: $(free -m | grep Mem | awk '{print $4}') MB"

# Extract disk usage percentage and strip the % sign
DISK_USED=$(df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//')
echo "Disk Used: ${DISK_USED}%"

# Conditional check
if [ "$DISK_USED" -gt 80 ]; then
    echo "CRITICAL: Disk Space 80% se zyada full ho gayi hai!"
else
    echo "STATUS: Disk Space normal level par hai."
fi
echo "==========================="
