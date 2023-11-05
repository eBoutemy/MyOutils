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
            echo "Pure-FTPd a été installé."
            ;;
        2 )
            echo "Création d'un nouvel utilisateur FTP"
            echo "Saisissez le nom de l'utilisateur FTP :"
            read ftp_username
            
            sudo useradd -d /home/$ftp_username -s /bin/false $ftp_username
            sudo pure-pw useradd $ftp_username -u $ftp_username -d /home/$ftp_username
            sudo pure-pw mkdb
            sudo ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb
            sudo chown -hR $ftp_username: /home/$ftp_username
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
