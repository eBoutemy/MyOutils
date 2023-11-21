#!/bin/bash

echo "MyOutils - LXC - DEBIAN"
quitter=1
while [ $quitter -ne 0 ]
do

echo " "
echo "Menu installation LXC - Debian"
echo " "
echo "1) Debian 10"
echo "2) Debian 11"
echo "3) Debian 12"
echo "0) Quitter"
echo "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		echo "Saisir un nom pour le contenaire"
		read namemachinedeb10
		DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachinedeb10 -- -d debian -r buster -a amd64
		systemctl restart lxc-net
		lxc-stop -n $namemachinedeb10
		lxc-start -n $namemachinedeb10
		lxc-attach -n $namemachinedeb10 -- apt-get update
     	lxc-attach -n $namemachinedeb10 -- apt-get install -y nano bash-completion
		lxc-ls -f
		;;
	2 )
		echo "Saisir un nom pour le contenaire"
		read namemachinedeb11
		DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachinedeb11 -- -d debian -r bullseye -a amd64
		systemctl restart lxc-net
		lxc-start -n $namemachinedeb11
		lxc-attach -n $namemachinedeb11 -- apt-get update
     	lxc-attach -n $namemachinedeb11 -- apt-get install -y nano bash-completion
		lxc-stop -n $namemachinedeb11
		lxc-start -n $namemachinedeb11
		lxc-ls -f
		;;
	3 )
		echo "Saisir un nom pour le contenaire"
		read namemachinedeb12
		DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachinedeb12 -- -d debian -r bookworm -a amd64
		systemctl restart lxc-net
		lxc-start -n $namemachinedeb12
		lxc-attach -n $namemachinedeb12 -- apt-get update
     	lxc-attach -n $namemachinedeb12 -- apt-get install -y nano bash-completion
		lxc-stop -n $namemachinedeb12
		lxc-start -n $namemachinedeb12
		lxc-ls -f
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


