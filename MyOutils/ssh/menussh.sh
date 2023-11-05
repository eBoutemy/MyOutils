#!/bin/bash
echo "Bienvenue dans :"
quitter=1
while [ $quitter -ne 0 ]; 
do

    echo " "
    figlet "Menu SSH"
    echo "1) Installation de SSH"
    echo "0) Quitter"
    echo "Veuillez choisir une option :"
    read choix
    case $choix in
    1)
        echo "Installation de openssh-server"
        sudo apt update && sudo apt install -y openssh-server

        echo "Souhaitez-vous mettre le PermitRootLogin sur no?"
        echo "O/n"
        read choixroot
        case $choixroot in
        [Oo])
            sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
            echo "Validé."
            ;;
        [Nn])
            ;;
        *)
            echo "Erreur dans la saisie"
            ;;
        esac

        echo "Souhaitez-vous changer le port SSH ?"
        echo "O/n"
        read choixport
        case $choixport in
        [Oo])
            echo "Quel est le nouveau numéro de port souhaité ?"
            read newport
            sudo sed -i "s/#Port 22/Port $newport/g" /etc/ssh/sshd_config
            echo "Validé."
            ;;
        [Nn])
            ;;
        *)
            echo "Erreur dans la saisie"
            ;;
        esac
        sudo service ssh restart
        sleep 2
        sudo ssh-keygen -lf /etc/ssh/ssh_host_ecdsa_key.pub -E sha256
        ;;
    0)
        quitter=0
		echo "Au revoir"
		;;
    *)
        echo "Erreur dans la saisie"
        ;;
    esac
done
