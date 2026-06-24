setfacl -m u:splunkfwd:r /var/log/$logFileToMonitor
setfacl -Rm u:splunkfwd:r /var/log/$directoryToMonitor