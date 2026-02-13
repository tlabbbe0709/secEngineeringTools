#!/bin/bash
set -e

if [[$(pwd) == /opt ]]; then
	echo "Downloading install file"
	wget -O splunk-9.4.1-e3bdab203ac8-linux-amd64.tgz "wget -O splunk-10.2.0-d749cb17ea65-linux-amd64.tgz "https://download.splunk.com/products/splunk/releases/10.2.0/linux/splunk-10.2.0-d749cb17ea65-linux-amd64.tgz""
else
	echo "Changing directories to /opt"
	cd /opt
	echo "Downloading install file"
	wget -O splunk-9.4.1-e3bdab203ac8-linux-amd64.tgz "wget -O splunk-10.2.0-d749cb17ea65-linux-amd64.tgz "https://download.splunk.com/products/splunk/releases/10.2.0/linux/splunk-10.2.0-d749cb17ea65-linux-amd64.tgz""
fi

echo "Adding splunk user"
adduser splunk

echo "Untaring install file"
tar -xvzf splunk-10.2.0-d749cb17ea65-linux-amd64.tgz

echo "ensuring ownership of splunk file to splunk user"
chown -R splunk: /opt/splunk

echo "Enabling boot start"
/opt/splunk/bin/splunk enable boot-start -systemd-managed 1 -user splunk --accept-license

echo "start splunk"
systemctl start Splunkd && echo "Installation Complete"