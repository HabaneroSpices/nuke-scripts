#!/bin/bash
# Generates SSL Cert | CRT & KEY Valid for 1 year

screenName=`basename "$0"`

if [ -z "$1" ] || [ -z "$2" ]; then echo -e "\n[!]Please provide at least two arguments\n[?]Usage: $screenName... [FQDN] [city]" && exit; fi

function gen(){
openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/CN=$1/C=US/L=$2" \
            -keyout rootCA.key -out rootCA.crt \
	    && true || false
}
if gen "$1" "$2"; then echo -e "\n[i]Successfully generated thy certificate"; else echo - "[i]Could not generate the certificate for mysterious reasons :O"; fi
