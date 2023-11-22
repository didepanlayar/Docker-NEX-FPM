#!/bin/bash

Red='\e[1;31m'
Green='\e[0;32m'
Yellow='\e[1;33m'
NC='\e[0m'
WORK_DIR=$(dirname "$0")
data=(`find $WORK_DIR -name *.log`)
for log in "${data[@]}"; do
    cat /dev/null > "$log"
    echo -e "${Yellow}INFO${NC}: Successfully deleted ${Red}$log${NC}"
done
