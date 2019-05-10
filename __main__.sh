#!/bin/bash

######################
###  INITIALISATION ##
######################
if [ $# -ne 0 ]; then
  echo "No Parameter(s) expected !"
  exit 1
fi

echo "Script is going to use Vagrant for :"
echo "  -> Destroy , re-Up and Provision VMLX01 with Ansible ( that will provide Docker to the VM )" 
echo "Let's Start ? (y / N)"


######################
### VALIDATE ACTION ##
######################
read answer
if [ "$answer" == "${answer#[Yy]}" ] ; then
  exit 1
fi


##################################
### VAGRANT PROCESS	 ( VMLX01 ) ##
##################################
cd VMLX01

vagrant destroy -f
if [ $? -eq 0 ] ; then
  echo "VMLX01 destruction OK !"
else
  echo "VMLX01 destruction FAILURE !"
fi

vagrant up
if [ $? -eq 0 ] ; then
  echo "VMLX01 installation OK !"
  echo "You can moved to VMs directories and then launch \"vagrant ssh\" or \"vagrant provision\" (already done)"
  exit 0
else
  echo "VMLX01 installation FAILURE !"
  exit 1
fi