#!/bin/bash
ansible-playbook /vagrant/database.yml -i /home/vagrant/host.txt
ansible-playbook /vagrant/web.yml -i /home/vagrant/host.txt
ansible-playbook /vagrant/balancer.yml -i /home/vagrant/host.txt