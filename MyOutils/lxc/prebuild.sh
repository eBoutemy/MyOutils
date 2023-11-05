#!/bin/bash

echo "MyOutils - LXC - PRE-BUILD"
quitter=1

while [ $quitter -ne 0 ]; do
  echo " "
  echo "Menu installation LXC - PRE-BUILD"
  echo " "
  echo "1) MariaDB (MySQL)"
  echo "2) Pure-FTPD"
  echo "3) OpenSSH-Server"
  echo "0) Quitter"
  echo "Veuillez choisir une option :"
  read choix

  case $choix in
    1)
      echo "Saisir un nom pour le conteneur"
      read namemachinedeb10
      DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachinedeb10 -- -d debian -r buster -a amd64
      sleep 1
      systemctl restart lxc-net
      sleep 1
      lxc-start -n $namemachinedeb10
      sleep 1
      lxc-attach -n $namemachinedeb10 -- apt-get update
      sleep 1
      lxc-attach -n $namemachinedeb10 -- apt-get install -y mariadb-server
      lxc-stop -n $namemachinedeb10
      lxc-start -n $namemachinedeb10
      echo "MariaDB (MySQL) a été installé dans le conteneur $namemachinedeb10."
      ;;

    2)
      echo "Saisir un nom pour le conteneur"
      read namemachinedeb2
      DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachinedeb2 -- -d debian -r buster -a amd64
      sleep 1
      systemctl restart lxc-net
      sleep 1
      lxc-start -n $namemachinedeb2
      sleep 1
      lxc-attach -n $namemachinedeb2 -- apt-get update
      sleep 1
      lxc-attach -n $namemachinedeb2 -- apt-get install -y pure-ftpd
      lxc-stop -n $namemachinedeb2
      lxc-start -n $namemachinedeb2
      echo "Pure-FTPd a été installé dans le conteneur $namemachinedeb2."
      ;;

    3)
      echo "Saisir un nom pour le conteneur"
      read namemachinedeb3
      DOWNLOAD_KEYSERVER="keyserver.ubuntu.com" lxc-create -t download -n $namemachinedeb3 -- -d debian -r buster -a amd64
      sleep 1
      systemctl restart lxc-net
      sleep 1
      lxc-start -n $namemachinedeb3
      sleep 1
      lxc-attach -n $namemachinedeb3 -- apt-get update
      sleep 1
      lxc-attach -n $namemachinedeb3 -- apt-get install -y openssh-server
      lxc-stop -n $namemachinedeb3
      lxc-start -n $namemachinedeb3
      echo "OpenSSH-Server a été installé dans le conteneur $namemachinedeb3."
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
