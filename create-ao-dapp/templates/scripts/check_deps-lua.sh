#!/bin/bash

LUA_VERSION="5.4.6"
AMALG_VERSION="0.8-1"

# Color codes for output
RED='\033[0;31m'    # Red color for errors
GREEN='\033[0;32m'  # Green color for success messages
NC='\033[0m'        # No Color (reset to default)

# Check if Lua is installed and the version is 5.4.6 or above
if ! lua -v | grep -q "Lua \?5\.4\.[6-9]\|5\.4\.[1-9][0-9]"; then
    echo -e "${RED}Lua 5.4.6 or higher is required.${NC}"
    exit 1
fi

# Check if Luarocks is installed
if ! command -v luarocks &> /dev/null; then
    echo -e "${RED}Luarocks is not installed.${NC}"
    exit 1
fi

# Check if luacheck is installed
if ! command -v luacheck &> /dev/null; then
    echo -e "${RED}luacheck is not installed.${NC}"
    exit 1
fi

# Check if amalg.lua is installed
if ! luarocks show amalg | grep -q "amalg $AMALG_VERSION"; then
    echo -e "${RED}amalg $AMALG_VERSION is not installed.${NC}"
    exit 1
fi

echo -e "${GREEN}All dependencies are installed correctly.${NC}"
exit 0
