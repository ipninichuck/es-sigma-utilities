#!/bin/bash

# HELK script: pull-sigma.sh
# HELK script description: Update local github repo and transform Windows SIGMA rules to Elastalert signatures
# HELK build Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g) 
# License: GPL-3.0

rule_path=/path/sigma/rules/...
target=es-detection
config=winlogbeat
backend_config=/path/backend_config.yml
destination=/path/ #what directory you would like the detection rules stored in

for rule in $rule_path/*; do
            echo "[+++] Processing Windows rule: $rule .."
            sigmac -t $target -c $config --backend-config $backend_config -o $destination/sigma_$(basename $rule).json $rule
            done
