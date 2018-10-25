# first argument is password, second argument is the salt
# copy and paste the whole value of the msg variable
ansible all -i localhost, -m debug -a "msg={{ '$1' | password_hash('sha512', '$2') }}"
