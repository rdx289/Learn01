#!/bin/bash
# server-stats.sh - Basic Server Performance Stats

echo "=============================="
echo "   SERVER PERFORMANCE REPORT  "
echo "=============================="

# OS version
echo -e "\n--- OS Version ---"
lsb_release -d 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME

# Uptime and load average
echo -e "\n--- Uptime & Load Average ---"
uptime

# Logged in users
echo -e "\n--- Logged In Users ---"
who

# CPU usage
echo -e "\n--- Total CPU Usage ---"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 + $4 "%"}'

# Memory usage
echo -e "\n--- Memory Usage ---"
free -h | awk '/Mem:/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2*100}'

# Disk usage
echo -e "\n--- Disk Usage ---"
df -h --total | grep total | awk '{printf "Used: %s / Total: %s (%s used)\n", $3, $2, $5}'

# Top 5 processes by CPU usage
echo -e "\n--- Top 5 Processes by CPU ---"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory usage
echo -e "\n--- Top 5 Processes by Memory ---"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Stretch goal: failed login attempts
echo -e "\n--- Failed Login Attempts ---"
lastb | head

echo -e "\nReport generated on: $(date)"
