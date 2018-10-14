# A basic IaaC to build a wordpress server

- requires storm-ssh installed
- configure your settings in

  1. the variables at the top of the build-server.sh
  2. the variables at the top of the delete-server.sh scripts
  3. ./cloudformation/parameters.json file

- run `sh build.sh` to build the server
  - this will setup the server in AWS install ssh key access locally
  - note: this has a step that requires you to press enter once the Stack has been successfully created

* run `sh delete.sh` to delete the server
