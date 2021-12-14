#!/bin/bash

#Amount of Free Memory
free -h > ~/backups/freemen/free_mem.txt

#Disk usage
df -h > ~/backups/diskuse/disk_usage.txt

#List of Open Files
lsof > ~/backups/openlist/open_list.txt

#Disk spack statistics
df -h > ~/backups/freedisk/free_disk.txt