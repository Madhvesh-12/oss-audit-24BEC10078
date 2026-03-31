#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Madhav | Student ID: 24BEC10078 | Course: Open Source Software
# Description: Loops through key system directories and reports their permissions,
#              owner, and disk usage. Also checks MySQL's config directory.

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================================"
echo "  Directory Audit Report"
echo "  Generated: $(date '+%d %B %Y, %H:%M:%S')"
echo "========================================================"
echo ""
printf "  %-15s %-25s %-10s\n" "Directory" "Permissions / Owner" "Size"
printf "  %-15s %-25s %-10s\n" "---------" "-------------------" "----"

# --- For loop: iterate over each directory and report ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, group using awk on ls -ld output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Get human-readable size; suppress permission-denied warnings with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-15s %-25s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        printf "  %-15s %s\n" "$DIR" "[does not exist on this system]"
    fi
done

echo ""
echo "========================================================"
echo "  MySQL Configuration Directory Check"
echo "========================================================"
echo ""

# --- MySQL config is typically stored in /etc/mysql ---
MYSQL_CONFIG_DIR="/etc/mysql"
MYSQL_CONFIG_FILE="/etc/mysql/mysql.conf.d/mysqld.cnf"

# Check the main MySQL config directory
if [ -d "$MYSQL_CONFIG_DIR" ]; then
    PERMS=$(ls -ld "$MYSQL_CONFIG_DIR" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$MYSQL_CONFIG_DIR" 2>/dev/null | cut -f1)
    echo "  [FOUND] MySQL config directory: $MYSQL_CONFIG_DIR"
    echo "          Permissions/Owner : $PERMS"
    echo "          Size              : ${SIZE:-N/A}"
else
    echo "  [NOT FOUND] $MYSQL_CONFIG_DIR does not exist."
    echo "  MySQL may not be installed, or may use /etc/my.cnf instead."
fi

echo ""

# Check the main mysqld config file
if [ -f "$MYSQL_CONFIG_FILE" ]; then
    PERMS=$(ls -l "$MYSQL_CONFIG_FILE" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$MYSQL_CONFIG_FILE" 2>/dev/null | cut -f1)
    echo "  [FOUND] MySQL server config: $MYSQL_CONFIG_FILE"
    echo "          Permissions/Owner : $PERMS"
    echo "          Size              : ${SIZE:-N/A}"
else
    # Also check the alternate location /etc/my.cnf (common on RHEL/Fedora)
    if [ -f "/etc/my.cnf" ]; then
        PERMS=$(ls -l "/etc/my.cnf" | awk '{print $1, $3, $4}')
        echo "  [FOUND] MySQL config (alternate): /etc/my.cnf"
        echo "          Permissions/Owner : $PERMS"
    else
        echo "  [INFO]  No MySQL config file found at $MYSQL_CONFIG_FILE or /etc/my.cnf"
    fi
fi

echo ""
echo "========================================================"
