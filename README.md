# Open Source Audit — MySQL

> Capstone Project | Open Source Software (OSS NGMC) | VIT

| Field | Details |
|-------|---------|
| **Student Name** | Madhvesh Dhirenkumar Kapadia |
| **Roll Number** | 24BEC10078 |
| **Course** | Open Source Software (OSS NGMC) |
| **Chosen Software** | MySQL |

---

## Repository Structure

```
oss-audit-24BEC10078/
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_permission_auditor.sh
├── script4_log_analyzer.sh
├── script5_manifesto_generator.sh
└── README.md
```

---

## Dependencies

| Tool | Required By | Install |
|------|-------------|---------|
| `bash` | All scripts | Pre-installed |
| `mysql` | Scripts 2, 3, 4 | `sudo apt install mysql-server` |
| `coreutils` | All scripts | Pre-installed |
| `procps` | Script 1 | Pre-installed |

---

## Scripts

#### Script 1 — System Identity Report
Displays a welcome screen with the Linux distribution, kernel version, logged-in user, home directory, system uptime, date/time, and the open-source license covering the OS.
```bash
bash script1_system_identity.sh
```

---

#### Script 2 — FOSS Package Inspector
Checks whether MySQL is installed, retrieves its version and package details, and prints a philosophy note for MySQL and other FOSS packages using a `case` statement.
```bash
bash script2_package_inspector.sh
```

---

#### Script 3 — Disk and Permission Auditor
Loops through five key system directories and reports permissions, owner, and disk usage. Also audits MySQL's configuration directory and config file.
```bash
bash script3_disk_permission_auditor.sh
```

---

#### Script 4 — Log File Analyzer
Reads a log file line by line, counts keyword matches, retries if the file is empty, and prints the last 5 matching lines.
```bash
# Usage: bash script4_log_analyzer.sh <logfile> [keyword]

bash script4_log_analyzer.sh /var/log/mysql/error.log error
bash script4_log_analyzer.sh /var/log/syslog warning
```
> If `/var/log/mysql/error.log` does not exist on your system, use `/var/log/syslog` instead.

---

#### Script 5 — Open Source Manifesto Generator
Asks the user three questions interactively and generates a personalised open-source philosophy statement, saved to `manifesto_<username>.txt`.
```bash
bash script5_manifesto_generator.sh
```

---

## Quick Start

```bash
# Clone the repo
git clone https://github.com/<your-username>/oss-audit-24BEC10078
cd oss-audit-24BEC10078

# Make scripts executable
chmod +x script*.sh

# Run
bash script1_system_identity.sh
bash script2_package_inspector.sh
bash script3_disk_permission_auditor.sh
bash script4_log_analyzer.sh /var/log/syslog error
bash script5_manifesto_generator.sh
```

---

## Tested On
Ubuntu 22.04 LTS — Bash 5.1
