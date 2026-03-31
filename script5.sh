#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Madhav | Student ID: 24BEC10078 | Course: Open Source Software
# Description: Interactively asks the user three questions and generates a
#              personalised open-source philosophy statement saved to a .txt file.

# --- Alias concept demonstration ---
# In an interactive shell you would define: alias today='date +%d\ %B\ %Y'
# Inside scripts, aliases are not expanded by default, so we use a function instead.
today() {
    date '+%d %B %Y'
}

echo "========================================================"
echo "  Open Source Manifesto Generator"
echo "  VIT — Open Source Software | 24BEC10078"
echo "========================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open-source philosophy statement."
echo ""

# --- Interactive input using 'read' ---
read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

# --- Gather metadata ---
DATE=$(today)                           # Use our alias-equivalent function
AUTHOR=$(whoami)                        # Current username
OUTPUT="manifesto_${AUTHOR}.txt"        # Output filename tied to the user

echo ""
echo "  Composing your manifesto..."
echo ""

# --- Write the manifesto using > to create and >> to append ---
echo "============================================================" > "$OUTPUT"
echo "  OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  Author : $AUTHOR" >> "$OUTPUT"
echo "  Date   : $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I, $AUTHOR, believe in the power of open source." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Every day I rely on $TOOL — a tool built by the community," >> "$OUTPUT"
echo "  for the community, and shared freely with the world." >> "$OUTPUT"
echo "  It reminds me that great software does not require a price tag;" >> "$OUTPUT"
echo "  it requires collaboration, transparency, and trust." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  MySQL, my chosen software for this audit, stands as proof" >> "$OUTPUT"
echo "  of that principle. Licensed under the GPL, it has powered" >> "$OUTPUT"
echo "  millions of applications — from small student projects to" >> "$OUTPUT"
echo "  global enterprise systems — without ever demanding a fee" >> "$OUTPUT"
echo "  from those who build openly alongside it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. In the world of open source," >> "$OUTPUT"
echo "  that freedom is not just a philosophy — it is written into" >> "$OUTPUT"
echo "  every licence, every commit, and every pull request." >> "$OUTPUT"
echo "  Freedom means the right to read the code, fix the bug," >> "$OUTPUT"
echo "  and pass the improvement back to everyone who comes after." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  One day I will build $BUILD and share it freely." >> "$OUTPUT"
echo "  Because the best gift a developer can give is code that" >> "$OUTPUT"
echo "  outlives their own need for it — code that others can" >> "$OUTPUT"
echo "  learn from, improve, and carry forward." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  This is my commitment to the open-source way." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $AUTHOR | $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm and display the saved manifesto ---
echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "========================================================"
cat "$OUTPUT"
echo "========================================================"
