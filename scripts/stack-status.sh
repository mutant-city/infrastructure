# watch the stack
status=$(aws cloudformation describe-stacks --stack-name $(cat ../stack.txt) | jq '.Stacks[0].StackStatus');
echo $status;

while [ $status != "\"CREATE_COMPLETE\"" ]
do
status=$(aws cloudformation describe-stacks --stack-name $(cat ../stack.txt) | jq '.Stacks[0].StackStatus');
echo $status;
sleep 2;
done