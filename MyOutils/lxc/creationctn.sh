#!/bin/bash
echo "MyOutils - LXC - Contenaire"
quitter=1
while [ $quitter -ne 0 ]
do

echo " "
echo "Menu Création de contenaire"

echo "1) Menu Debian"
echo "2) Menu Ubuntu"
echo "0) Quitter"
echo "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		bash lxc/debian.sh
		;;
	2 )
		bash lxc/ubuntu.sh
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


