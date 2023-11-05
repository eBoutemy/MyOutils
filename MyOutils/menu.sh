#!/bin/bash

echo "Bienvenu dans :"
quitter=1

while [ $quitter -ne 0 ]
do

echo " "
figlet "Menu principal"

echo "1) Menu LXC"
echo "2) Menu SSH"
echo "3) Menu PURE-FTPD"
echo "4) Menu CMS"
echo "0) Quitter"
echo "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		bash lxc/menulxc.sh
		;;
	2 )
		bash ssh/menussh.sh
		;;
	3 )
		bash pure_ftpd/menupureftpd.sh
		;;
	4 )
		bash cms/menucms.sh
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


