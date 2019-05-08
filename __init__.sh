#!/bin/bash
su

###
#	DEPENDANCIES
###

# 1st Parameter :

# IPTABLES Config File : 
iptablesRules="./res/iptables.rules.sh"
# SSH Config File : 
sshConfig="./res/sshd_config"

# NGINX Config File : 
nginxProxy="./res/default.conf"




###
#	Install 'iptables'
###
sudo apt install iptables -y --fix-missing
sudo $iptablesRules

###
#	Install 'ssh'
###
sudo apt install ssh -y --fix-missing
sudo cp $sshConfig /etc/ssh/sshd_config -f

###
#	Install 'nginx'
###
sudo apt install nginx -y --fix-missing
sudo cp $nginxProxy /etc/nginx/conf.d/default.conf -f

###
#	Install 'Virtualbox' + extpack
###
sudo apt-add-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-6.0 -y --fix-missing

wget -q https://download.virtualbox.org/virtualbox/6.0.6/Oracle_VM_VirtualBox_Extension_Pack-6.0.6.vbox-extpack
sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.0.6.vbox-extpack

###
#	Install 'Vagrant'
###
wget -q https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.deb
sudo dpkg -i vagrant_2.2.4_x86_64.deb

###
#	Install 'ansible'
###
sudo apt-get update
sudo apt-get install software-properties-common -y --fix-missing
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y --fix-missing
