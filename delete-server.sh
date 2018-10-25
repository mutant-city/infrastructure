#!/bin/bash
SERVER_IP=34.208.204.238
STACK_NAME=$(cat ./stack.txt)
aws cloudformation delete-stack --stack-name $STACK_NAME
storm delete $STACK_NAME
ssh-keygen -R $SERVER_IP
# removes any retry playbooks
if [ -f ./*.retry ]; then rm *.retry; fi
