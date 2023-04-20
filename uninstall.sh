#!/bin/bash
clear

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run as root.${NC}\n"
    exit 1
fi

# Check if hidemyip.sh is installed
if ! command -v hidemyip.sh &> /dev/null; then
    echo -e "${RED}hidemyip.sh is not installed.${NC}\n"
    exit 1
fi

# Delete hidemyip.sh
sudo rm -f /usr/bin/hidemyip.sh
echo -e "${GREEN}hidemyip.sh has been deleted successfully.${NC}\n"

# Remove HideYourSelf directory
echo -e "${YELLOW}Removing HideYourSelf directory...${NC}\n"
rm -rf HideYourSelf
echo -e "${GREEN}HideYourSelf directory has been removed.${NC}\n"

# Print message for how to remove all the program
echo -e "${YELLOW}To Remove All The Program Please Run:${NC}\n"
echo -e "${YELLOW}cd ..${NC}\n"
echo -e "${YELLOW}rm -rf HideYourSelf${NC}"

echo -e "\n\n\n\n\n"
echo -e "${GREEN}Created By GiuCoder${NC}"
