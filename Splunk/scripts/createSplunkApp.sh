#!/bin/bash
set -e

variable_name="SPLUNK_HOME"
variable_value=$(find /path/to/search -type f -exec grep -E "^${variable_name}=" {} \; | head -n 1 | cut -d'=' -f2)
echo "$variable_value"