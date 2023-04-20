#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if zenity is installed
if ! command -v zenity &> /dev/null; then
    echo -e "${RED}Zenity is not installed. Installing...${NC}"
    sudo apt-get install zenity
fi

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run as root.${NC}"
    exit 1
fi

# Prompt the user for their IP address
ip_addr=$(zenity --entry --title="Enter your IP address" --text="Please enter your IP address:")

# Check if the user entered an IP address
if [ -z "$ip_addr" ]; then
    echo -e "${RED}No IP address entered.${NC}"
    exit 1
fi

# Add the iptables rule to drop incoming traffic from the specified IP address
if sudo iptables -A INPUT -s "$ip_addr" -j DROP; then
    echo -e "${GREEN}Success! Your IP address has been hidden from the Internet.${NC}"
    zenity --info --title "Success" --text "Your IP address has been hidden from the Internet."
else
    echo -e "${RED}An error occurred while hiding your IP address.${NC}"
    zenity --error --title "Error" --text "An error occurred while hiding your IP address."
fi

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
echo -e "${GREEN}Created By GiuCoder${NC}"
