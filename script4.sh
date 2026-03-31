#!/bin/bash
# Script 4: Log File Analyzer
# Author: Madhvesh Kapadia | Course: Open Source Software
# Usage Example:
# ./script4.sh /var/log/syslog error

# --- Command-line Arguments ---
LOGFILE=$1                 # Log file passed as argument
KEYWORD=${2:-"error"}     # Default keyword is 'error'

COUNT=0                    # Counter variable

echo "================================"
echo "        Log File Analyzer"
echo "================================"

# --- Check if file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# --- Do-while style retry if file empty ---
# This loop keeps running until file has content
while [ ! -s "$LOGFILE" ]; do
    echo "File is empty. Waiting for data..."
    sleep 5
done

echo "Analyzing file: $LOGFILE"
echo "Searching for keyword: $KEYWORD"
echo ""

# --- Read file line by line ---
while IFS= read -r LINE; do

    # Check if keyword exists in line
    if echo "$LINE" | grep -iq "$KEYWORD"; then

        COUNT=$((COUNT + 1))   # Increase counter

    fi

done < "$LOGFILE"

# --- Print Summary ---
echo "================================"
echo "Summary Report"
echo "================================"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

echo ""
echo "Last 5 matching lines:"

# --- Display last 5 matching lines ---
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo "================================"
