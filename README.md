# A basic IaaC to build a wordpress server

- requires storm-ssh installed
- configure your settings in the variable at the top of the build-server.sh and delete-server.sh scripts

- run `sh build.sh` to build the server
  - this will setup the server in AWS install ssh key access locally
  - note: this has a step that requires you to press enter once the Stack has been successfully created
