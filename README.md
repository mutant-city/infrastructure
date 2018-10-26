# A basic IaaC to build a wordpress server

## Notes

- use Ansible Vault on your variable files

  - https://serversforhackers.com/c/how-ansible-vault-works
  - `ansible-vault encrypt group_var/all.yml`
  - can use the prompt OR file method if you have any ansible-vault created configs(nothing should be plaintext)
    - https://docs.ansible.com/ansible/2.4/vault.html

- Lets Encrypt (apparently) has a rate limit. So can simply comment wordpress-ssl out of the playbook for an http only version of the configuration. Can then add it back it when/if you think rate limiting won't be an issue(hint: it takes one week.)

## SSL Notes

- This only gives an A rating on SSL Labs. There are further optimizations to get an A+.
- One optimization: Can generate dhparams key (which takes a while) to bump up score/security
  - https://scotthelme.co.uk/squeezing-a-little-more-out-of-your-qualys-score/
- if have time:
  - https://gist.github.com/plentz/6737338

## Dependencies

- requires storm-ssh installed
- require aws-cli installed
- requires jq json command line parser

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

2. run `sh configure-server.sh` to configure the server which runs all of the ansible scripts

## Delete

- run `sh delete.sh` to delete the server
  - deletes the cloudformation stack and wipes EVERYTHING

## References

### Nginx Conf

- https://github.com/Leo-G/DevopsWiki/wiki/How-to-Install---Wordpress-with-Nginx,-PHP-FPM-and-MariaDB-on-Ubuntu-14.04-(LEMP)
- https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/
- https://codex.wordpress.org/Nginx
- https://github.com/tucsonlabs/ansible-playbook-wordpress-nginx/blob/master/roles/nginx/templates/nginx-wp-common.conf
- http://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size

### SSL

- https://reinhard.codes/2017/01/27/setting-up-nginx-and-letsencrypt-on-a-homeserver-using-ansible/
- https://www.nginx.com/blog/free-certificates-lets-encrypt-and-nginx/

## To Do

- bug in cookies and "Remember Me" on login page
- AMI backup
