#!/bin/bash
su

###
#	DEPENDANCIES
###

# 1st Parameter : Precise username to be first sudoers




###
#	Update Repo
###
apt update
apt upgrade
apt dist-upgrade

###
#	Install 'sudo'
###
apt install sudo -y
usermod -a -G sudo $1
su $1
sudo passwd -l root
