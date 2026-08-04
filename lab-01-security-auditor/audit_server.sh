#!/bin/bash

# Output File Definition
REPORT_FILE="SECURITY_REPORT.md"

echo "=================================================="
echo " Starting Linux System Security & Health Audit..."
echo "=================================================="

# 1. Header & System Profile (Chapter 1 & 5)
echo "# Linux Server Security & Audit Report" > $REPORT_FILE
echo "**Generated Date:** $(date)" >> $REPORT_FILE
echo "**Audited By User:** $(whoami)" >> $REPORT_FILE
echo "**Hostname:** $(hostname)" >> $REPORT_FILE
echo "---" >> $REPORT_FILE

# 2. Kernel & OS Information (Chapter 1 & 3)
echo "## 1. System & Kernel Profile" >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE
uname -a >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE

# 3. Security Audit - Root & User Accounts (Chapter 3.6.1)
echo "## 2. User & Access Security Audit" >> $REPORT_FILE
echo "* **UID 0 (Root Privileged Accounts):**" >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE
awk -F: '($3 == 0) {print $1}' /etc/passwd >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE

# 4. Active Network Connections & Privacy (Chapter 3.6)
echo "## 3. Active Network Ports & Traffic" >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE
ss -tuln 2>/dev/null || netstat -tuln 2>/dev/null >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE

# 5. Disk Space & Memory Health (Chapter 3.7 Cloud & VM readiness)
echo "## 4. Hardware Resources Snapshot" >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE
df -h >> $REPORT_FILE
free -h >> $REPORT_FILE
echo "\`\`\`" >> $REPORT_FILE

echo "=================================================="
echo " Audit Complete! Report saved to: $REPORT_FILE"
echo "=================================================="
