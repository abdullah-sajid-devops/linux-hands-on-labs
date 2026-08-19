# Lab 03: Automated Backup Script with Cron Scheduling

A Bash script that automatically backs up a target directory, compresses it, and cleans up old backups on its own — scheduled to run unattended via a cron job.

## What It Does

1. **Defines source and backup directories** — configurable paths for what to back up and where to store it
2. **Creates the backup directory if it doesn't exist** (`mkdir -p`)
3. **Generates a unique timestamp** for each backup run, so files never overwrite each other
4. **Creates a compressed `.tar.gz` archive** of the source directory, named with the timestamp
5. **Prints a confirmation message** showing where the backup was saved
6. **Cleans up old backups automatically** — deletes any backup file older than a set threshold, preventing the backup folder from growing indefinitely

## The Script

```bash
#!/bin/bash

SOURCE_DIR="/var/log"
BACKUP_DIR="/home/ubuntu/backups"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Generate a unique timestamp for this backup
TIME=$(date +%y-%m-%d_%H-%M-%S)

# Create the compressed archive
tar -czf "$BACKUP_DIR/backup_$TIME.tar.gz" "$SOURCE_DIR"

echo "backup created in $BACKUP_DIR/backup_$TIME.tar.gz"

# Rotation: delete backups older than 10 minutes
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mmin +10 -exec rm -f {} \;
```

## Concepts Applied

- Variable definition for reusable, configurable paths
- `mkdir -p` for safe, idempotent directory creation
- Command substitution with `date` for dynamic, unique filenames
- `tar -czf` for creating compressed archives
- `find` with `-mmin` and `-exec` for time-based file cleanup/rotation
- **Cron job scheduling** for unattended, automated execution

## Running It on a Schedule (Cron)

Scheduled the script to run automatically at short intervals to observe and verify the rotation logic in action — confirming that only recent backups (within the retention window) remained in the backup directory over time, while older ones were automatically removed.

## A Note on `tar` Warnings

While backing up live log files, `tar` may print warnings like:

tar: /var/log/syslog: file changed as we read it

This is expected behavior — the system continues writing to active log files even while the backup is being created. The archive still completes successfully despite the warning.

## Usage

```bash
chmod +x backup.sh
./backup.sh
```

To schedule it via cron:
```bash
crontab -e
# Add a line like:
* * * * * /path/to/backup.sh
```

## Reflection

Built and understood step-by-step, then tested live via cron to confirm the automation and cleanup logic actually behaved as expected — not just written and assumed to work.

#Linux #DevOps #BashScripting #CronJobs
