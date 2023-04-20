#!/bin/bash

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Check if hidemyip.sh is installed
if [ ! -f "/usr/bin/hidemyip.sh" ]; then
    echo "hidemyip.sh is not installed."
    exit 1
fi

# Remove hidemyip.sh
sudo rm /usr/bin/hidemyip.sh

echo "hidemyip.sh has been successfully deleted."

# Check if HideYourSelf directory exists
if [ ! -d "HideYourSelf" ]; then
    echo "HideYourSelf directory is not found."
    exit 1
fi

# Remove HideYourSelf directory
rm -r HideYourSelf

echo "HideYourSelf directory has been successfully deleted."

echo "To use this program again, follow the instructions on GitHub." 
