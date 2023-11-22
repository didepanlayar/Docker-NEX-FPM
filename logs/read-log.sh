#!/bin/bash

Red='\e[1;31m'
Green='\e[0;32m'
Yellow='\e[1;33m'
NC='\e[0m'
read -p "Number of Rows: " GET_ROW
[[ -z ${GET_ROW} ]] && GET_ROW=100
WORK_DIR=$(dirname "$0")
data=(`find $WORK_DIR -name *.log`)
for log in "${data[@]}"; do
    echo -e ""
    echo -e "${Yellow}READ${NC}: Read file ${Green}$log${NC}"
    tail -n "$GET_ROW" "$log"
done
