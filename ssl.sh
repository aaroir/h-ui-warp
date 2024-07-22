#!/bin/bash
read -rp "Please enter the pointed domain / sub-domain name: " domain
read -rp "Please enter the email address : " email
apt install curl socat -y
wait
curl https://get.acme.sh | sh
wait
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
wait
~/.acme.sh/acme.sh --register-account -m $email
wait
~/.acme.sh/acme.sh --issue -d $domain --standalone
wait
~/.acme.sh/acme.sh --installcert -d $domain --key-file /root/private.key --fullchain-file /root/cert.crt
wait
clear
printf "\Cert Address : /root/cert.crt \n"
printf "\Key Address : /root/private.key \n"
