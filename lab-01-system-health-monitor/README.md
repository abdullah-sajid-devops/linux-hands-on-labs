# Lab 01: System Health Monitor

A Bash script that checks system memory and disk usage, and raises a warning if disk space usage crosses a defined threshold.

## What It Does

- Reports free memory using `free -m`
- Extracts current disk usage percentage using `df -h`
- Flags a **CRITICAL** warning if disk usage exceeds 80%, otherwise reports normal status

## The Script

See [system-audit.sh](system-audit.sh) for the full script.

## Concepts Applied

- Command substitution (`$(...)`)
- `free` and `df` for system resource reporting
- `awk` for extracting specific fields from command output
- `sed` for stripping unwanted characters (the `%` sign)
- `if/else` conditional logic for threshold-based alerting

## Usage

```bash
chmod +x system-audit.sh
./system-audit.sh
```

## Reflection

Understood the underlying concepts first, then rebuilt and tested the script independently on a live Linux environment to confirm real understanding.
