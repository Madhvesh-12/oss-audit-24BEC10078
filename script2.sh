#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Madhav | Student ID: 24BEC10078 | Course: Open Source Software
# Description: Checks if MySQL is installed on the system, finds its version,
#              and uses a case statement to print philosophy notes for FOSS packages.

# --- Define the package to inspect ---
PACKAGE="mysql"   # Chosen open-source software for this audit

echo "========================================================"
echo "  FOSS Package Inspector — Auditing: $PACKAGE"
echo "========================================================"
echo ""

# --- Check if MySQL is installed using if-then-else ---
# mysql --version works reliably across distros without needing root
if command -v mysql &>/dev/null; then
    echo "  [INSTALLED]  $PACKAGE is present on this system."
    echo ""

    # Show the MySQL client version
    echo "  Version Info:"
    mysql --version

    # Try dpkg first (Debian/Ubuntu), fall back to rpm (RHEL/Fedora)
    if dpkg -l mysql-server &>/dev/null 2>&1; then
        echo ""
        echo "  Package Details (dpkg):"
        dpkg -l mysql-server | grep "^ii" | awk '{print "    Package: "$2"\n    Version: "$3}'
    elif rpm -qi mysql-server &>/dev/null 2>&1; then
        echo ""
        echo "  Package Details (rpm):"
        rpm -qi mysql-server | grep -E 'Version|License|Summary'
    else
        echo ""
        echo "  (Package manager details not available — MySQL may be installed manually)"
    fi
else
    echo "  [NOT FOUND]  $PACKAGE is NOT installed on this system."
    echo "  Install it with: sudo apt install mysql-server   (Debian/Ubuntu)"
    echo "                or: sudo dnf install mysql-server   (Fedora/RHEL)"
fi

echo ""
echo "========================================================"
echo "  Open Source Philosophy Notes"
echo "========================================================"
echo ""

# --- Case statement: print a philosophy note based on the package name ---
case $PACKAGE in
    mysql)
        echo "  MySQL: Open source at the heart of millions of applications."
        echo "  Originally released in 1995, MySQL is licensed under the GPL,"
        echo "  making it freely available to developers worldwide. Its dual"
        echo "  licensing model — GPL for open-source use, commercial for"
        echo "  proprietary products — reflects the balance between openness"
        echo "  and sustainable development that defines modern FOSS."
        ;;
    git)
        echo "  Git: Born from the Linux kernel community, Git is the"
        echo "  backbone of collaborative open-source development worldwide."
        echo "  Its distributed model means every clone is a full backup."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Apache's permissive licence lets businesses build freely"
        echo "  without restriction, driving its global dominance."
        ;;
    firefox)
        echo "  Firefox: Mozilla's browser, proof that a non-profit can build"
        echo "  world-class software and keep the web open for everyone."
        ;;
    vlc)
        echo "  VLC: The media player that plays everything, no questions asked."
        echo "  Maintained by VideoLAN under the GPL with no proprietary codecs."
        ;;
    *)
        echo "  $PACKAGE: An open-source tool that embodies the FOSS spirit —"
        echo "  free to use, inspect, modify, and share by anyone."
        ;;
esac

echo ""
echo "========================================================"
