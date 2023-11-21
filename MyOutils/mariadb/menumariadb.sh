#!/bin/bash

echo "Bienvenue dans :"
quitter=1

while [ $quitter -ne 0 ]; do
    echo " "
    figlet "Menu MariaDB-server"

    echo "1) Installation MariaDB-server"
    echo "2) Ajout "
    echo "0) Retour au menu principal"
    echo -e "Veuillez choisir une option :"
    read choix

    case $choix in 
        1 )
            echo "Installation MariaDB-server"
            sudo apt update
            sudo apt install -y mariadb-server
            echo "MariaDB-server a été installé."
            ;;
        2 )
            echo "Nom de la base de données"
            read namebd
            sudo mysql -e "create database $namebd;"
            echo "Nom de l'utilsateur admin"
            read nameadmin
            echo "Nots de passe administrateur"
            read mdpadmin
            sudo mysql -e "create user $nameadmin@'localhost' identified by '$mdpadmin';"
            sudo mysql -e "grant all on $namebd.* to $nameadmin@'localhost';flush privileges;"
            ;;

        0 )
            quitter=0
            ;;

        * )
            echo "Erreur dans la saisie"
            ;;

    esac
done
