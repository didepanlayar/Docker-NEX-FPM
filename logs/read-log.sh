#!/bin/bash

read -p "Number of Rows: " GET_ROW
[[ -z ${GET_ROW} ]] && GET_ROW=100
data=(`find logs -name *.log`)
for log in "${data[@]}"; do
    echo "READ: $log"
    tail -n "$GET_ROW" "$log"
done
