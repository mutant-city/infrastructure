#!/bin/bash
SERVER_IP=34.208.204.238
SERVER_KEY_DIR=/Users/admin/.ssh/nick-personal-aws.pem
STACK_NAME=nick-aws

# cloudformation build
aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://cloudformation/ec2.json  --parameters file://cloudformation/parameters.json

# ssh keys
if [[ `storm list` == *$STACK_NAME* ]]; then storm delete $STACK_NAME; fi
storm add $STACK_NAME --id_file $SERVER_KEY_DIR  ubuntu@$SERVER_IP:22

# remove the cached key for the old server at this ip
ssh-keygen -R $SERVER_IP

# install python for ansible(-o skips asking if want to add to key file)
ssh -o "StrictHostKeyChecking no" $STACK_NAME sudo apt -y install python

# removes any retry playbooks
if [ -f ./playbook.retry ]; then rm playbook.retry; fi
