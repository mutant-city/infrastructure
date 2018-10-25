# A basic IaaC to build a wordpress server

## Notes

- Each of these roles is a complete module.

  - The only interactions it should have with other modules is via defaults variables.
  - This provides a drag and drop solution that can be moved to future ansible playbooks easily.

## SSL Notes

- This only gives an A rating on SSL Labs. There are further optimizations to get an A+.
- One optimization: Can generate dhparams key (which takes a while) to bump up score/security
  - https://scotthelme.co.uk/squeezing-a-little-more-out-of-your-qualys-score/
- if have time:
  - https://gist.github.com/plentz/6737338

## Dependencies

- requires storm-ssh installed
- require aws-cli installed

  - https://github.com/emre/storm

## Configure

- configure your cloudformation settings in

  1. the variables at the top of the helpers scripts: build-server.sh/config-server.sh/delete-server.sh
  2. ./cloudformation/parameters.json file

- configure your variables in the defaults files of the ansible roles
  - warning: be sure to use ansible-vault or some other way to secure private information!

## Run

1. run `sh build-server.sh` to build the server

   - this will setup the server using Cloudformation and install ssh key access locally into storm-ssh
   - wait for the stack to complete building in cloudformation. Status must = CREATE_COMPLETE before next step.

2. run `sh configure-server.sh` to configure the server
   - note: use the prompt or file method if you have any ansible-vault created configs(nothing should be plaintext)
   - https://docs.ansible.com/ansible/2.4/vault.html

## Delete

- run `sh delete.sh` to delete the server
  - deletes the cloudformation stack and wipes EVERYTHING

## References

- https://www.nginx.com/blog/free-certificates-lets-encrypt-and-nginx/
