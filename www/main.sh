#!/bin/bash

######################
###  INITIALISATION ##
######################

if [ $# -ne 0 ]; then
  echo "No Parameter(s) expected !"
  exit 1
fi

box=generic/debian9
privateIP=192.168.2.23
forwardedGuestPort=80
forwardedHostPort=1996
hostname=www
dockerScript=scripts/dockerInstaller.sh
setupEnv=scripts/settingUpEnv.sh

echo "Parameters are :"
echo "  Box ~> \"$box\""
echo "  PrivateNetwork IP@ ~> \"$privateIP\")"
echo "  Forwarded port ~> guest:$forwardedGuestPort <-> host:$forwardedHostPort)"
echo "  Hostname ~> \"$hostname\""
echo "\nDocker will be installed on the guest VM\n"
echo "Let's Start ? (y / N)"

read answer
if [ "$answer" == "${answer#[Yy]}" ] ; then
  exit 1
fi

touch Vagrantfile
echo "Vagrant.configure(\"2\") do |config|" 		> Vagrantfile
echo "  config.vm.box = \"$box\""			>> Vagrantfile
echo "  config.vm.box_version = \"1.9.6\""		>> Vagrantfile
echo "  config.vm.network \"private_network\", ip:\"$privateIP\"" >> Vagrantfile
echo "  config.vm.network \"forwarded_port\", guest: $forwardedGuestPort, host: $forwardedHostPort" >> Vagrantfile
echo "  config.vm.hostname = \"$hostname\""		>> Vagrantfile
echo ""							>> Vagrantfile
echo "  config.vm.provision \"file\", source: \"$dockerScript\", destination:\"$dockerScript\""	>> Vagrantfile
echo "  config.vm.provision \"shell\", inline: <<-SHELL" >> Vagrantfile
echo "    ./$setupEnv"                                  >> Vagrantfile
echo "    ./$dockerScript"				>> Vagrantfile
echo "  SHELL"						>> Vagrantfile
echo "end" 						>> Vagrantfile
echo "\"Vagrantfile\" generated !"

vagrant up

if [ $? -eq 0 ] ; then
  echo "\n\nIt seems to worked ! (Be aware because host forwarded port < 1024 need to be root)\n\n ~> Continue with 'vagrant ssh'\n"
else
  echo "\nOh it failed !"
fi

