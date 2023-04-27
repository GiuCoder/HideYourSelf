#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if the user is running a supported Linux distribution
if [[ "$(cat /etc/os-release | grep -o '^ID=.*' | cut -d '=' -f 2)" != "ubuntu" ]]; then
    printf "${RED}This script is only supported on Ubuntu.${NC}\n"
    exit 1
fi

# Check if zenity is installed
if ! command -v zenity &> /dev/null; then
    printf "${RED}Zenity is not installed. Installing...${NC}\n"
    sudo apt-get install zenity || { printf "${RED}Failed to install Zenity.${NC}\n"; exit 1; }
fi

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    printf "${RED}This script must be run as root.${NC}\n"
    exit 1
fi

# Prompt the user for their IP address
ip_addr=$(zenity --entry --title="Enter your IP address" --text="Please enter your IP address:")

# Check if the user entered an IP address
if [ -z "$ip_addr" ]; then
    printf "${RED}No IP address entered.${NC}\n"
    exit 1
fi

# Add the iptables rule to drop incoming traffic from the specified IP address
if sudo iptables -A INPUT -s "$ip_addr" -j DROP; then
    printf "${GREEN}Success! Your IP address has been hidden from the Internet.${NC}\n"
    zenity --info --title "Success" --text "Your IP address has been hidden from the Internet."
else
    printf "${RED}An error occurred while hiding your IP address.${NC}\n"
    zenity --error --title "Error" --text "An error occurred while hiding your IP address."
fi

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
echo -e "${GREEN}Created By GiuCoder${NC}"
