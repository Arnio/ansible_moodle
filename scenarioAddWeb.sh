#!/bin/bash
webIP=$1
webName=$2
#sudo sed -i "/    upstream moodle {/a\      server $WEBHOST;" /etc/nginx/nginx.conf
cat <<EOF | sudo tee -a /home/vagrant/host.txt
$webName ansible_host=$webIP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/$webIP.pem
EOF
sudo chmod 500 /home/vagrant/.ssh/*.pem