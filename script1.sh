#!/bin/bash
# Script 1: System Identity Report
# Author: Madhvesh Kapadia | Registration No.: 24BEC10078 | Course: Open Source Software
# Description: Displays a welcome screen with Linux system identity information

# --- Variables ---
STUDENT_NAME="Madhvesh Kapadia"           # Student's name
STUDENT_ID="24BEC10078"        		 # Registration no.
SOFTWARE_CHOICE="MySQL"         # Chosen open-source software for this audit

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                          # Kernel version
USER_NAME=$(whoami)                         # Currently logged-in username
HOME_DIR=$HOME                              # User's home directory
UPTIME=$(uptime -p)                         # Uptime
DATETIME=$(date '+%d %B %Y, %H:%M:%S')     # Current date and time
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')  # Distro name

# --- Determine the OS license ---
# Most Linux distros ship the kernel under GPL-2.0
OS_LICENSE="GNU General Public License v2.0 (GPL-2.0)"

# --- Display the welcome screen ---
echo "========================================================"
echo "       Open Source Audit — $STUDENT_NAME ($STUDENT_ID)"
echo "       Audited Software : $SOFTWARE_CHOICE"
echo "========================================================"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $DATETIME"
echo ""
echo "  License Note : The Linux kernel and most core OS components"
echo "                 are covered by the $OS_LICENSE."
echo "                 This ensures users' freedoms to run, study,"
echo "                 share, and modify the software."
echo ""
echo "========================================================"
