#!/bin/bash

echo "Bienvenue dans :"
quitter=1

while [ $quitter -ne 0 ]; do
    echo " "
    figlet "Menu Pure-FTPD"

    echo "1) Installation Pure-FTPD"
    echo "2) Créer un utilisateur FTP"
    echo "0) Retour au menu principal"
    echo -e "Veuillez choisir une option :"
    read choix

    case $choix in 
        1 )
            echo "Installation de Pure-FTPd"
            sudo apt update
            sudo apt install -y pure-ftpd
            sudo service pure-ftpd restart
            groupadd --gid 6262 ftpGroup
            useradd -u 6262 -g ftpGroup -d /dev/null -s /bin/false ftpUser
            ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/75puredb
            echo no > /etc/pure-ftpd/conf/PAMAuthentication
            echo no > /etc/pure-ftpd/conf/UnixAuthentication
            touch /etc/pure-ftpd/conf/CreateHomeDir
            echo yes > /etc/pure-ftpd/conf/CreateHomeDir
            echo "Pure-FTPd a été installé."
            ;;
        2 )
            echo "Création d'un nouvel utilisateur FTP"
            echo "Saisissez le nom de l'utilisateur FTP :"
            read ftp_username
            pure-pw useradd $ftp_username -u ftpUser -d /home/$ftp_username -m
            echo "Utilisateur FTP créé avec accès au répertoire personnel."
            ;;
        0 )
            quitter=0
            ;;

        * )
            echo "Erreur dans la saisie"
            ;;

    esac
done
