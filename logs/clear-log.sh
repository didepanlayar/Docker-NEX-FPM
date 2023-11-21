#!/bin/bash

data=(`find logs -name *.log`)
for log in "${data[@]}"; do
    cat /dev/null > "$log"
    echo "INFO: Successfully deleted $log"
done
