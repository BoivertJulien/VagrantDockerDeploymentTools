#!/bin/bash

######################
###  INITIALISATION ##
######################

if [ $# -ne 0 ]; then
  echo "No Parameter(s) expected !"
  exit 1
fi

echo "Script is going to :"
echo "  -> setup 2 Vm : \"VM1\" & \"VM2\""
echo "  -> VM1 will setup env for running GITLAB & WWW"
echo "  -> VM2 will setup env for running PORTUS & PORTAINER"
echo "  -> So Docker & Docker-compose are going to be installed on the 2 Vagrant VMs"
echo "Let's Start ? (y / N)"

read answer
if [ "$answer" == "${answer#[Yy]}" ] ; then
  exit 1
fi

cd VM1

echo "Moved to \"VM1/\" and now making \"vagrant up\""
vagrant up
echo "VM1 installation results :"
if [ $? -eq 0 ] ; then
  echo "It seems to worked ! (Be aware because host forwarded port < 1024 need to be root)"
else
  echo "VM1 installation failed !"
fi

cd ../VM2
echo "Moved to \"../VM2/\" and now making \"vagrant up\""
vagrant up
echo "VM2 installation results :"
if [ $? -eq 0 ] ; then
  echo "It seems to worked ! (Be aware because host forwarded port < 1024 need to be root)"
else
  echo "VM2 installation failed !"
fi

cd ..
echo ""
echo "Moved to main directory... you can moved to VMs directories and then launch \"vagrant ssh\""
echo "Once into the vagrant VM, you could start docker services from prepared-scripts into ~/"
