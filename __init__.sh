#!/bin/bash

CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
if [ ${CAN_I_RUN_SUDO} -eq 0 ]
then
    echo "PLEASE INSTALL SUDO BEFORE (eventually lock root account) :"
    echo ""
    echo "apt update"
	echo "apt upgrade"
	echo "apt dist-upgrade"
    echo ""

	echo "apt install sudo -y"
	echo "usermod -a -G sudo $1"
	echo "su $1"
	echo "sudo passwd -l root"
	echo ""

	echo "[IF YOU LOCK ROOT ACCOUNT SOME ERRORS (such as bad fstab file) COULD LEAD TO BOOT FAILURE]"
	echo "[ ( watch in 'tools' directory how to add second HDD in /etc/fstab mounted on '/' ) ]"

    exit 1
fi

############################################################
#	DEPENDANCIES 						####################
############################################################

# IPTABLES Config File : 
iptablesRules="./HostRessources/iptables.rules.sh"
# SSH Config File : 
sshConfig="./HostRessources/sshd_config"
# NGINX Config File : 
nginxProxy="./HostRessources/default.conf"


############################################################
#	Firewall + SSH 						####################
############################################################

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

############################################################
#	Reverse Proxy 						####################
############################################################

###
#	Install 'nginx'
###
sudo apt install nginx -y --fix-missing
sudo cp $nginxProxy /etc/nginx/conf.d/default.conf -f


############################################################
#	Install 'Virtualbox' + extpack 		####################
############################################################

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

echo "You host machine is ready..."
echo "You can now go to VM folder, run 'vagrant up|ssh|destroy' :"
