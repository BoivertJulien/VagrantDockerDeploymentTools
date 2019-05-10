# VagrantDockerDeploymentTools

Outils pour la mise en place d'un serveur dédié à l'hebergement de machines virtuelles.
* **Vagrant/VirtualBox** pour les VMs.
* **Ansible** pour le provisionning des VM (installation docker et mise en place des services [serveurs WEB])
* **SUDO** + **REVERSE PROXY** (nginx) + **FIREWALL** (IPTables) etc.. sur la machine hote

## Prerequisites

Les commandes suivantes avec les droits super-utilisateur sont necessaires.
On commence par mettre a jour l'OS (basé sur Debian) :

```
apt update
apt upgrade
apt dist-upgrade
```

Puis il faut installer sudo, et ajouter votre utilisateur aux sudoers :

```
apt install sudo -y
usermod -a -G sudo <username>
```

Il est possible de supprimer la connection de l'utilisateur root.

```
sudo passwd -l root
```

## Principe

1. Cloner le dépot sur votre serveur après une *clean install*.
2. Lancer le script "__init__.sh" à la racine du repo. Celui-ci installera :
	* un firewall IPTables selon le fichier contenu dans le repertoire "Ressources".
	* ssh et utilisera la configuration contenu dans le repertoire "ressources"
	* nginx en tant que reverse proxy (pour les services qui seront proposés par les conteneurs)
	* virtualbox + extension pack
	* vagrant
	* ansible
3. Rentrer dans le repertoire de nom "VMLX01" et réaliser la commande "vagrant up" qui :
	* deploiera la VM Vagrant
	* approvisionnera la VM (installation de docker et mise en place des service [wordpress, www etc...])
4. On peut desormer se connecter à la machine avec "vagrant ssh" ou bien acceder directement aux services depuis le réseau local (selon les redirections renseignés et les configuration du firewall).
	La configuration par défault devrait :

PS: Un des services mit en place est un serveur web dont le code est accessible [ici](https://github.com/BoivertJulien/WebPageTemplate).
