VagrantDockerDeploymentTools

# "www" Directory provide script that:
  - generate "Vagrantfile" with custom settings:
    - box (exemple generic/debian9)
    - box version (exemple 1.9.6)
    - @IP on private network (exemple 192.168.2.23)
    - guest:port forwarded to host:port (exemple forward guest:80<<to>>host:1996)
    - copy/paste a directory into the VM (exemple ./scripts)
    - execute a "setup" script into the VM (exemple: update >> install docker >> install nginx container)
  - install/start VM ("vagrant up") => exploit "Vagrantfile" we generated

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~ SCHEMA ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 ########### ##########   ########## ###########
 # GITLAB  # #  WWW   #   # PORTUS # #PORTAINER#
 ########### ##########   ########## ###########

 ######################   ########## ###########
 # DEBIAN VAGRANT VM  #   # DEBIAN VAGRANT VM  #
 # + Docker & Compose #   # + Docker & Compose #
 ######################   ######################

 ###############################################
 #		PHYSICAL MACHINE               #
 #		 -> Host Machine               #
 #		   -> Debian                   #
 ###############################################

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
