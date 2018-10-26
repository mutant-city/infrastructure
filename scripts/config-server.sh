# removes any retry playbooks
STACK_NAME=nick-aws

if [ -f ../*.retry ]; then rm ../*.retry; fi

# install python for ansible(-o skips asking if want to add to key file)
ssh -o "StrictHostKeyChecking no" $STACK_NAME sudo apt -y install python

# run ansible to configure the server
cd .. && ansible-playbook --vault-id @prompt playbook.yml