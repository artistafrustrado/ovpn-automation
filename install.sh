#!/bin/bash

#install required packages
apt-get install openvpn zip dialog

cp -fr /usr/share/doc/openvpn/examples/easy-rsa/2.0/ easy-rsa/

echo "Não esqueça de editar o arquivo easy-rsa/vars" 
