#!/bin/bash
LOG_FILE="/var/log/dpkg.log"

# Search the log file for errors and count matching lines
ERROR_COUNT=$(grep -i "error" $LOG_FILE | wc -l)

echo "==========================="
echo "    LOG ANALYZER REPORT    "
echo "==========================="
echo "Target Log File: $LOG_FILE"
echo "Total Errors Found: $ERROR_COUNT"

# Conditional check
if [ "$ERROR_COUNT" -gt 0 ]; then
    echo "WARNING: Log file mein errors maujood hain!"
else
    echo "STATUS: System logs bilkul clean hain, koi error nahi mila."
fi
echo "==========================="
