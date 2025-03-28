#!/bin/bash

# Configuration
GOTIFY_URL="192.168.0.0"  # Replace with your Gotify server URL and port number, if required
APP_TOKEN="xxxxxxxxxxxxx"  # Replace with your Gotify application token
HOST=`hostname`

# Check for updates
UPDATES=$(apt list --upgradable 2>/dev/null | grep -v "Listing...")

if [ -n "$UPDATES" ]; then
    # Prepare the message
    MESSAGE="Updates are available: $UPDATES"
    
    # Send notification to Gotify
    curl "http://$GOTIFY_URL/message?token=$APP_TOKEN" -F "title=Updates available for $HOST" -F "message=$MESSAGE" -F "priority=5"
    
fi
exit 0
