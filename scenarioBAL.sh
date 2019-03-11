#!/bin/bash
databaseIP=$1
balancerIP=$2
sudo yum -y update
#Install ansible
sudo yum -y install epel-release
sudo yum -y install ansible
sudo sed -i -e 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg
rm -f /home/vagrant/host.txt
cat <<EOF | sudo tee -a /home/vagrant/host.txt
[db_server]
moodledb ansible_host=$databaseIP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/$databaseIP.pem

[balancer]
moodlebal ansible_host=$balancerIP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/$balancerIP.pem 

EOF

