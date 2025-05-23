#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Developer Tool Uninstallation${NC}"
echo "--------------------------------"

# Check if pipx is installed
if ! command -v pipx &> /dev/null; then
    echo -e "${RED}Warning: pipx not found. Will try to remove files manually.${NC}"
fi

# Remove from all possible locations
echo "Cleaning up all installations..."

# Remove from /usr/local/bin (requires sudo)
if [ -f "/usr/local/bin/dev_tool" ]; then
    echo "Removing from /usr/local/bin..."
    sudo rm "/usr/local/bin/dev_tool"
fi

# Remove from ~/.local/bin
if [ -L "$HOME/.local/bin/dev_tool" ]; then
    echo "Removing from ~/.local/bin..."
    rm "$HOME/.local/bin/dev_tool"
fi

# Remove pipx installation if exists
if command -v pipx &> /dev/null; then
    if pipx list | grep -q "dev_tool"; then
        echo "Removing pipx installation..."
        pipx uninstall dev_tool
    fi
fi

# Remove configuration directory with force
CONFIG_DIR="$HOME/.config/dev_tool"
if [ -d "$CONFIG_DIR" ]; then
    echo "Removing configuration directory..."
    rm -rf "$CONFIG_DIR"
    if [ -d "$CONFIG_DIR" ]; then
        echo -e "${RED}Failed to remove configuration directory. Please remove it manually:${NC}"
        echo "rm -rf $CONFIG_DIR"
    else
        echo -e "${GREEN}Configuration directory removed successfully${NC}"
    fi
else
    echo "Configuration directory not found"
fi

# Final verification
echo -e "\n${BLUE}Verifying uninstallation...${NC}"

FOUND_ISSUES=0

# Check command availability
if command -v dev_tool &> /dev/null; then
    echo -e "${RED}Warning: dev_tool is still available in PATH at:${NC}"
    which dev_tool
    FOUND_ISSUES=1
fi

# Check config directory
if [ -d "$CONFIG_DIR" ]; then
    echo -e "${RED}Warning: Configuration directory still exists at:${NC}"
    echo "$CONFIG_DIR"
    FOUND_ISSUES=1
fi

if [ $FOUND_ISSUES -eq 0 ]; then
    echo -e "${GREEN}dev_tool has been completely removed from your system${NC}"
else
    echo -e "\n${RED}Some components could not be removed automatically.${NC}"
    echo "Please remove them manually or contact support."
fi

echo -e "\n${GREEN}Uninstallation completed!${NC}"
echo "Note: You may need to restart your terminal for all changes to take effect."