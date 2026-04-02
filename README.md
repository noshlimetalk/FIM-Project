### Technologies Used

Linux (Ubuntu)
Bash Scrripting
inotifywait(real-time file monitoring)
sha256sum (file hashing)
Linux permissions & ownership
System Logging

## Monitored Directories

- /etc
- /var/log

These directories were selected because they contain:

- System configuarions
- Authentication logss
- Security-relevant files

  ## How it Works

The script uses inotifywait to watch filesystems events such as 
-modify
- create
- Delete
- attribute changes

  ## Alert Logging

  When a change occurs, the system logs
  -timestamp
  -file path
  -action detected

  2026-03-20 20:15 - Changed detected: /etc/passwd (MODIFY)

  logs are stored in logs/fim_alerts.log

  ### Security Concepts Demonstrated

  - File Integrity Monitoring
  - Linux Filesystem Security
  - Host-Based intrusion detection
  - Event Monitoring
  - Hash-Based validation
  - Security logging
 

  ## Skills Learned

  - Bash Automation
  - Linux Security Monitoring
  - Incident detection concepts
  - SOC workflow fundementals
  - Defensive cybersecurity engineering
