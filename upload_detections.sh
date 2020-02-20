#!/bin/bash


# Description: Uploads Detections to Elastic Deployment
# Author: Roberto Rodriguez (@Cyb3rWard0g) & Modified for Elastic Detections by Ivan Ninichuck
# License: GPL-3.0

rule_directory=/path/ #The directory where the rules are stored
kibana=localhost:5601 #kibana URL: Add /s/spacename for specific kibana space

for rule in $rule_directory/*.json ; do
            echo "+++ Uploading Detections to Elastic Deployment +++"
            curl  -X POST "${kibana}/api/detection_engine/rules" -H 'kbn-xsrf: true' --data-binary @/$rule
            done

