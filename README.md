# A basic IaaC to build a wordpress server

## Notes

- Each of these roles is a complete module.
  - The only interactions it should have with other modules is via defaults variables.
  - This provides a drag and drop solution that can be moved to future ansible playbooks easily.

## Dependencies

- requires storm-ssh installed

  - https://github.com/emre/storm

## Configure

- configure your cloudformation settings in

  1. the variables at the top of the build-server.sh
  2. the variables at the top of the delete-server.sh scripts
  3. ./cloudformation/parameters.json file

- configure your variables in the defaults files of the ansible roles
  - note: be sure to use ansible-vault or some other way to secure private information!

## Run

1. run `sh build.sh` to build the server

- this will setup the server using Cloudformation and install ssh key access locally

2. `ansible-playbook --vault-id @prompt playbook.yml`
   - note: use the prompt or file method if you have any ansible-vault created configs(nothing should be plaintext)
   - https://docs.ansible.com/ansible/2.4/vault.html

## Delete

- run `sh delete.sh` to delete the server
  - deletes the cloudformation stack and wipes EVERYTHING
