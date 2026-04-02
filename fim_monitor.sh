#!/bin/bash

# Directories to monitor
WATCH_DIRS="/etc /var/log"

# Log file location
LOGFILE="../logs/fim_alerts.log"

# Baseline hash file
BASELINE="../baseline/baseline_hashes.txt"

echo "Starting File Integrity Monitor..."
echo "Logging to $LOGFILE"

# Start monitoring
inotifywait -m -r -e modify,create,delete,attrib $WATCH_DIRS |
while read path action file
do
FULLPATH="${path}${file}"
TIME=$(date '+%Y-%m-%d %H:%M:%S')

echo "$TIME - CHANGE DETECTED: $FULLPATH [$action]" | tee -a "$LOGFILE"

# If file exists, compare hashes
if [ -f "$FULLPATH" ]; then
CURRENT_HASH=$(sha256sum "$FULLPATH" | awk '{print $1}')
BASE_HASH=$(grep "$FULLPATH" "$BASELINE" 2>/dev/null | awk '{print $1}')

if [ "$CURRENT_HASH" != "$BASE_HASH" ]; then
echo "$TIME - HASH MISMATCH: $FULLPATH" | tee -a "$LOGFILE"
fi
fi
done
