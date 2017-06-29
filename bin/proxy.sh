#!/bin/bash
# This script expects:
# PROXY_URL - the proxy server in format http://someproxy.com:port
# PROXY_USER - the username used for authentication

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

mavenProxy(){
	# setup Maven proxy settings
	(
	cat <<-EOF
		<settings>
		    <proxies>
		        <proxy>
		            <id>proxy</id>
		            <active>true</active>
		            <protocol>http</protocol>
		            <host>$3</host>
		            <port>$4</port>
		            <username>$1</username>
		            <password>$2</password>
		            <nonProxyHosts></nonProxyHosts>
		        </proxy>
		    </proxies>
		</settings>
	EOF
	) > ~/.m2/settings.xml
}

myProxy(){
	echo "Setup proxy"
	echo "Address: $PROXY_URL"
	echo "Username: $PROXY_USER"
	read -p "Password: " -s pass &&  echo -e " "
	http_proxy_value="http://$PROXY_USER:$pass@$PROXY_URL"
	no_proxy_value="localhost,127.0.0.1,LocalAddress,LocalDomain.com"
	assignProxy $http_proxy_value $no_proxy_value
	mavenProxy $PROXY_USER $pass ${PROXY_URL%:*} ${PROXY_URL#*:}
}

[ -z "$http_proxy" ] && myProxy
