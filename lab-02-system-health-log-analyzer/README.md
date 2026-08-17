# Lab 02: System Health Auditor & Log Analyzer

Two small Bash scripts built to apply core Linux concepts — command substitution, text processing, and conditional logic — in practical, real-world scenarios.

---

## Script 1: System Health Auditor (`system-audit.sh`)

Checks system memory and disk usage, flagging a warning if disk space usage crosses a defined threshold (80%).

### Concepts Applied
- Command substitution (`$(...)`)
- `free` and `df` for system resource reporting
- `awk` for extracting specific fields from command output
- `sed` for stripping unwanted characters (the `%` sign)
- `if/else` conditional logic for threshold-based alerting

### Usage
```bash
chmod +x system-audit.sh
./system-audit.sh
```

See [system-audit.sh](system-audit.sh) for the full script.

---

## Script 2: Log Analyzer (`log-analyzer.sh`)

Scans a specified log file for lines containing the word "error" and reports the total count, along with a clear status message.

### Concepts Applied
- `grep -i` for case-insensitive pattern matching
- `wc -l` for counting matched lines
- Variable storage of command output for reuse
- `if/else` conditional logic for status reporting

### Usage
```bash
chmod +x log-analyzer.sh
./log-analyzer.sh
```

See [log-analyzer.sh](log-analyzer.sh) for the full script.

---

## 🎥 Demo

A screen recording of both scripts running live is linked in the corresponding LinkedIn post.
Linkedin: https://lnkd.in/p/dia6puK3
## Reflection

Both scripts were first understood with guidance, then rebuilt and tested independently to confirm real understanding — not just copy-pasted code. This is the first step toward writing automation scripts from scratch without assistance.
