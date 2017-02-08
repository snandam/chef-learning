========== Host machine
```sh
# Install vagrant vbguest. It's a required plugin
vagrant plugin install vagrant-vbguest

# Ansible playbook bootstraps the vagrant machine with necessary tools. It installs the latest version of chef dk
# Installs the latest version of ruby and foodcritic required for testing
vagrant provision --provision-with ansible

# This is to run a recipe as part of vagrant. chef-solo and chef-client are installed as part of install chef. Run this after you have run ansible
vagrant provision --provision-with chef_solo

```

========== Node

Login

```sh
vagrant ssh
sudo su
```


#### Exercise 0:

- If you have run the vagrant provision command for chef_solo, make sure it's run successfully and check the file
```sh
cat /tmp/helloworld.txt
```

#### Exercise 1:

##### Install httpd and run it

```sh

# Individual commands
ruby -c /vagrant/cookbooks/exercise1/recipes/default.rb
foodcritic /vagrant/cookbooks/exercise1/recipes/default.rb
chef-client --local-mode /vagrant/cookbooks/exercise1/recipes/default.rb

# One command to run all
cd /vagrant/cookbooks/exercise1/recipes
ruby -c default.rb && foodcritic default.rb && chef-client --local-mode default.rb

```
