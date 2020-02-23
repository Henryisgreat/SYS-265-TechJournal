#!/bin/bash
#RSALogin.sh
#create user that can only login via RSA

echo "Name of the user:"
read Username

if (( $EUID != 0)); then
	echo "Permission Denied"
	exit
fi

if [! -z "$1"]; then
	useradd -m -d /home/$1 -s bin/bash $1
	mkdir /home/$1.ssh
	cp /SYS-265-TechJournal/linux/public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
	chmod 700 /home/$1/.ssh
	chmod 600 /home/$1/.ssh/authorized_keys
	chown -R $1:$1 /home/$1/.ssh
fi
