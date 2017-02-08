========== Host machine
```sh
# Install vagrant vbguest. It's a required plugin
vagrant plugin install vagrant-vbguest

# Ansible playbook bootstraps the vagrant machine with necessary tools. It installs the latest version of chef dk
# Installs the latest version of ruby and foodcritic required for testing
vagrant provision --provision-with ansible

# This is to run a recipe as part of vagrant. You can run the below exercises instead of running this command.
vagrant provision --provision-with chef_solo

```

========== Node

#### Exercise 0:

- If you have run the vagrant provision command for chef_solo, make sure it's run successfully and check the file
```sh
cat /tmp/helloworld.txt
```

#### Exercise 1:

##### Install httpd and run it

```sh
vagrant ssh
sudo su

# Individual commands
ruby -c /vagrant/cookbooks/exercise1/recipes/default.rb
foodcritic /vagrant/cookbooks/exercise1/recipes/default.rb
chef-client --local-mode /vagrant/cookbooks/exercise1/recipes/default.rb

# One command to run all
cd /vagrant/cookbooks/exercise1/recipes
ruby -c default.rb && foodcritic default.rb && chef-client --local-mode default.rb

```
