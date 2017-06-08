#!/bin/bash

assignProxy(){
	PROXY_ENV="http_proxy ftp_proxy all_proxy https_proxy HTTP_PROXY FTP_PROXY ALL_PROXY HTTPS_PROXY"
	for envar in $PROXY_ENV
	do
		export $envar=$1
	done
	for envar in "no_proxy NO_PROXY"
	do
		export $envar=$2
	done
}

clrProxy(){
	assignProxy "" # This is what 'unset' does.
}

myProxy(){
	echo "Setup proxy"
	echo "Address: $PROXY_URL"
	echo "Username: $PROXY_USER"
	read -p "Password: " -s pass &&  echo -e " "
	http_proxy_value="http://$PROXY_USER:$pass@$PROXY_URL"
	no_proxy_value="localhost,127.0.0.1,LocalAddress,LocalDomain.com"
	assignProxy $http_proxy_value $no_proxy_value
}

[ -z "$http_proxy" ] && myProxy
