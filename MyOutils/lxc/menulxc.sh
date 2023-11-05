#!/bin/bash
echo "MyOutils - LXC"
quitter=1
while [ $quitter -ne 0 ]
do

echo " "
figlet "Menu LXC"

echo "1) Installation de LXC"
echo "2) Création de conteneur"
echo "3) Création de conteneur pré-build"
echo "0) Quitter"
echo "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		apt-get install sudo -y
		sudo apt-get install -y lxc
		sudo rm /etc/lxc/default.conf
		sudo cp lxc/default.conf /etc/lxc/
		sudo cp lxc/lxc-net /etc/default/
		sudo systemctl restart lxc-net
		echo "Installation et configuration terminées"
		;;
	2 )
		bash lxc/creationctn.sh
		;;
	3 )
		bash lxc/prebuild.sh
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


