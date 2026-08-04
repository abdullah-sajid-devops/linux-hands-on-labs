# Lab 01: Linux Server Security & Health Auditor

An automated Bash script that generates a full server security and health audit report — combining concepts from Chapters 1-7 of Cisco's Linux Essentials.

## What It Checks
- System & Kernel Profile
- User & Access Security (flags UID 0 accounts)
- Active Network Ports (`ss -tuln`)
- Hardware Resources (disk & memory)

## Usage
```bash
chmod +x audit_server.sh
./audit_server.sh
```

## License
MIT — see [LICENSE](LICENSE)
