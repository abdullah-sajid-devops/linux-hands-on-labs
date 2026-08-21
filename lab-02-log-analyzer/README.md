# Lab 02: Log Analyzer

A Bash script that scans a specified log file for error entries and reports the total count, along with a clear status message.

## What It Does

- Searches a target log file for lines containing the word "error" (case-insensitive)
- Counts the number of matching lines
- Reports a **WARNING** if errors are found, otherwise confirms the logs are clean

## The Script

See [log-analyzer.sh](log-analyzer.sh) for the full script.

## Concepts Applied

- `grep -i` for case-insensitive pattern matching
- `wc -l` for counting matched lines
- Variable storage of command output for reuse
- `if/else` conditional logic for status reporting

## Usage

```bash
chmod +x log-analyzer.sh
./log-analyzer.sh
```

## Reflection

Understood the underlying concepts first, then rebuilt and tested the script independently on a live Linux environment to confirm real understanding.
