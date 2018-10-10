#!/bin/bash
aws cloudformation create-stack --stack-name nick-aws-ec2-instance-2 --template-body file://cloudformation/ec2.json  --parameters file://cloudformation/parameters.json