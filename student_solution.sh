#!/bin/bash

# SELinux Access Denial Practical
# Student Name:
# Register Number:

echo "===== SELinux Status ====="
getenforce

echo "===== Creating Web Directory ====="
mkdir /myweb
echo "===== Creating HTML File ====="
echo "Hello SELinux" > /myweb/index.html

echo "===== Setting Linux Permissions ====="
chmod 755 /myweb
chmod 644 /myweb/index.html

echo "===== Checking Initial Context ====="
ls -Zd /myweb
ls -Z /myweb/index.html

echo "===== Assigning Wrong SELinux Context ====="
chcon -t default t /myweb/index.html

echo "===== Checking Wrong Context ====="
ls -Z /myweb/index.html

echo "===== Checking AVC Denials ====="
echo "===== Correcting SELinux Context ====="
ausearch -m AVC,USER_AVC -ts recent

echo "===== Checking Correct Context ====="

sealert -a /var/log/audit/audit.log
echo "===== Practical Completed ====="
