#!/bin/bash
webIP=$1
webName=$2
sudo sed -i "/    upstream moodle {/a\      server $webIP;" /vagrant/templates/nginx.conf.j2
cat <<EOF | sudo tee -a /home/vagrant/host.txt
[first_web_server]
$webName ansible_host=$webIP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/$webIP.pem

[web_server]
$webName ansible_host=$webIP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/$webIP.pem
EOF
sudo chmod 600 /home/vagrant/.ssh/*.pem
