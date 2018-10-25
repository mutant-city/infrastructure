#!/bin/bash
SERVER_IP=34.208.204.238
SERVER_KEY_DIR=/Users/admin/.ssh/nick-personal-aws.pem
STACK_NAME=nick-aws
AWS_STACK_NAME="$STACK_NAME-$(date +%s)"
# cloudformation build(with timestamp)
aws cloudformation create-stack --stack-name $AWS_STACK_NAME  --template-body file://cloudformation/ec2.json  --parameters file://cloudformation/parameters.json

echo $AWS_STACK_NAME > stack.txt

# ssh keys
# checks if storm has the stack-name/ssh key name present in its ssh config and deletes
if [[ `storm list` == *$STACK_NAME* ]]; then storm delete $STACK_NAME; fi
storm add $STACK_NAME --id_file $SERVER_KEY_DIR  ubuntu@$SERVER_IP:22

# remove the cached key for the old server at this ip
ssh-keygen -R $SERVER_IP

# removes any retry playbooks
if [ -f ./*.retry ]; then rm *.retry; fi
