#!/bin/bash
set -e

echo "Set transparent_hugepage/enabled to 'never'"
echo never > /sys/kernel/mm/transparent_hugepage/enabled && echo "Success"

echo "Set transparent_hugepage/defrag to 'never"
echo never > /sys/kernel/mm/transparent_hugepage/defrag && echo "Success"

echo "Edit rc.local to disable THP at boot time"
echo "#disable THP at boot time
if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
      echo never > /sys/kernel/mm/transparent_hugepage/enabled
fi
if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
    echo never > /sys/kernel/mm/transparent_hugepage/defrag
fi" >> /etc/rc.local && echo "Success"
echo "THP is now disabled"