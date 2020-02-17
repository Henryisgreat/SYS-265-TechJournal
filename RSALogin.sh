#!/bin/bash
#RSALogin.sh
#create user that can only login via RSA

echo "Name of the user:"
read Username

if (( $EUID != 0)); then
	echo "Permission Denied"
	exit
fi

if (( $EUID >= 1)); then
	useradd -m -d /home/$username -s bin/bash $username
	mkdir /home/$username.ssh
	cp $username/linux/public-keys/id_rsa.pub /home/$username/.ssh/authorized_keys
	chmod 700 /home/$username/.ssh
	chmod 600 /home/$username/.ssh/authorized_keys
	chown -R $username:$username /home/$username/.ssh
fi
