#!/bin/bash


echo "********************************"
echo "* Bienvenue Sur mon Projet SYS *" 
echo "********************************"


while :
do

echo "1-Afficher les Information des Utilisateurs Enregistres il ya trois jours"
echo "2-Acquerir, installer et lancer XAMPP"
echo "3-Archiver des elements du repertoire personnel modifies par le user Sodoer il ya deux jours"
echo "4-Afficher les informations sur l'utilisation du disque,du processeur et de la swap "
echo "5-Quitter"


read -p "Que voulez-vous faire?" op
case $op in 
	#liste de tout les users
	'1') cut -d : -f 1 /etc/passwd>all_users
	
	#liste des repertoires se trouvant dans /home 
	ls /home>user_foders
	
	while read line 
	do
		while read line1
		do
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<user_foders
	done<all_users
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then
		echo " $user a été crée il ya 3jour">3days_user.txt
	      fi

	  done<user1 
	done<userx
	cat 3days_users.txt
 ;;
	'2') echo "téléchargement  de xampp"
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	 echo " installation "
	 ./xampp-linux-x64-5.6.30-1-installer.run
	
	 sudo su
	#arret du service apache 
	service apache2 stop
	#arret du service ftp
	service proftpd stop
	#demarage de xampp
	/opt/lampp/lampp start
;;
	'3') echo "archivage"
	#archivage des fichier du rep home modifier par le sudoer il ya 2 jours
	mkdir -p /home/ushi-deshi/archive
	find /home/ushi-deshi/ -type f -mtime 2 -print>/home/ushi-deshi/ficmodi
	while read line
	do
	cp $line archive
	done </home/ushi-deshi/ficmodi
	tar -czvf archive.tar.gz archive
	#mv archive.tar.gz /media/usb/*/archive.tar.gz
	mv archive.tar.gz /home/ushi-deshi/prof/archive.tar.gz
	;;
	'4') echo "les informations sur l'utilisation du disque :"
		df -h |grep /dev/sd
		echo "les informations sur l'utilisation de la memoire et de la swap :"
		free -h 
;;
	'5' )  exit;;
        *) echo  "$op ne correspond a aucun choix"
esac
done

#!/bin/bash


echo "********************************"
echo "* Bienvenue Sur mon Projet SYS *" 
echo "********************************"


while :
do

echo "1-Afficher les Information des Utilisateurs Enregistres il ya trois jours"
echo "2-Acquerir, installer et lancer XAMPP"
echo "3-Archiver des elements du repertoire personnel modifies par le user Sodoer il ya deux jours"
echo "4-Afficher les informations sur l'utilisation du disque,du processeur et de la swap "
echo "5-Quitter"


read -p "Que voulez-vous faire?" op
case $op in 
	#liste de tout les users
	'1') cut -d : -f 1 /etc/passwd>all_users
	
	#liste des repertoires se trouvant dans /home 
	ls /home>user_foders
	
	while read line 
	do
		while read line1
		do
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<user_foders
	done<all_users
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then
		echo " $user a été crée il ya 3jour">3days_user.txt
	      fi

	  done<user1 
	done<userx
	cat 3days_users.txt
 ;;
	'2') echo "téléchargement  de xampp"
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	 echo " installation "
	 ./xampp-linux-x64-5.6.30-1-installer.run
	
	 sudo su
	#arret du service apache 
	service apache2 stop
	#arret du service ftp
	service proftpd stop
	#demarage de xampp
	/opt/lampp/lampp start
;;
	'3') echo "archivage"
	#archivage des fichier du rep home modifier par le sudoer il ya 2 jours
	mkdir -p /home/ushi-deshi/archive
	find /home/ushi-deshi/ -type f -mtime 2 -print>/home/ushi-deshi/ficmodi
	while read line
	do
	cp $line archive
	done </home/ushi-deshi/ficmodi
	tar -czvf archive.tar.gz archive
	#mv archive.tar.gz /media/usb/*/archive.tar.gz
	mv archive.tar.gz /home/ushi-deshi/prof/archive.tar.gz
	;;
	'4') echo "les informations sur l'utilisation du disque :"
		df -h |grep /dev/sd
		echo "les informations sur l'utilisation de la memoire et de la swap :"
		free -h 
;;
	'5' )  exit;;
        *) echo  "$op ne correspond a aucun choix"
esac
done

