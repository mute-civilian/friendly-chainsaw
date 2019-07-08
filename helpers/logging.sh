#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
PURPLE='\033[0;35m'
LIGHT_BLUE='\033[0;36m'
NC='\033[0m' # No Color

function red {
    echo -e "${RED}$1${NC}"
}

function green {
    echo -e "${GREEN}$1${NC}"
}

function yellow {
	echo -e "${YELLOW}$1${NC}"
}

function purple {
	echo -e "${PURPLE}$1${NC}"
}

function blue {
	echo -e "${LIGHT_BLUE}$1${NC}"
}
