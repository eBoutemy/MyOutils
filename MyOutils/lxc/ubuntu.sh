#!/bin/bash
echo "MyOutils - LXC - UBUNTU"
quitter=1
while [ $quitter -ne 0 ]
do

echo " "
echo "Menu installation LXC - Ubuntu"
echo " "
echo "1) Ubuntu 16"
echo "2) Ubuntu 18"
echo "3) Ubuntu 20"
echo "4) Ubuntu 22"
echo "0) Quitter"
echo "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		echo "Saisir un nom pour le contenaire"
		read namemachineubuntu16
		DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachineubuntu16 -- -d ubuntu -r xenial -a amd64
		systemctl restart lxc-net
		lxc-start -n $namemachineubuntu16
		lxc-attach -n $namemachineubuntu16 -- apt-get update
     	lxc-attach -n $namemachineubuntu16 -- apt-get install -y nano bash-completion
		lxc-stop -n $namemachineubuntu16
		lxc-start -n $namemachineubuntu16
		;;
	2 )
		echo "Saisir un nom pour le contenaire"
		read namemachineubuntu18
		DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachineubuntu18 -- -d ubuntu -r bionic -a amd64
		lxc-start -n $namemachineubuntu18
		lxc-attach -n $namemachineubuntu18 -- apt-get update
     	lxc-attach -n $namemachineubuntu18 -- apt-get install -y nano bash-completion
		lxc-stop -n $namemachineubuntu18
		lxc-start -n $namemachineubuntu18
		;;
	3 )
		echo "Saisir un nom pour le contenaire"
		read namemachineubuntu20
		DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachineubuntu20 -- -d ubuntu -r focal -a amd64
		lxc-start -n $namemachineubuntu20
		lxc-attach -n $namemachineubuntu20 -- apt-get update
     	lxc-attach -n $namemachineubuntu20 -- apt-get install -y nano bash-completion
		lxc-stop -n $namemachineubuntu20
		lxc-start -n $namemachineubuntu20
		;;
	4 )
		echo "Saisir un nom pour le contenaire"
		read namemachineubuntu22
		DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachineubuntu22 -- -d ubuntu -r jammy -a amd64
		lxc-start -n $namemachineubuntu22
		lxc-attach -n $namemachineubuntu22 -- apt-get update
     	lxc-attach -n $namemachineubuntu22 -- apt-get install -y nano bash-completion
		lxc-stop -n $namemachineubuntu22
		lxc-start -n $namemachineubuntu22
		;;
	0 )
		quitter=0
		echo "Au revoir"
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done


