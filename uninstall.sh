#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run as root.${NC}"
    exit 1
fi

# Check if hidemyip.sh is installed
if ! command -v hidemyip.sh &> /dev/null; then
    echo -e "${RED}hidemyip.sh is not installed.${NC}"
    exit 1
fi

# Show loading animation while deleting hidemyip.sh
echo -e "${YELLOW}Deleting hidemyip.sh...${NC}"
spinner="/-\|"
while sudo rm -f /usr/bin/hidemyip.sh 2>/dev/null; do
    printf "\b${spinner:0:1}"
    spinner=${spinner:1}${spinner:0:1}
done
echo -e "\n${GREEN}hidemyip.sh has been deleted successfully.${NC}"

echo -e "${YELLOW}Removing HideYourSelf directory...${NC}"
rm -rf HideYourSelf
echo -e "${GREEN}HideYourSelf directory has been removed.${NC}"

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
echo -e "${GREEN}Created By GiuCoder${NC}"
