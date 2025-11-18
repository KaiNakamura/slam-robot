#!/bin/bash

# Create X11 authentication file for Docker
XAUTH=/tmp/.docker.xauth

# Remove existing auth file if it exists
if [ -f $XAUTH ]; then
    rm $XAUTH
fi

# Create new auth file
touch $XAUTH

# Set proper permissions
chmod 777 $XAUTH

# Add X11 authentication
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

echo "X11 authentication setup complete."
