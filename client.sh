#!/bin/bash
#  apt-get install unzip zip dialog
# load config
source config/config.sh
HERE=$(pwd)

# ASK QUESTIONS
CLINAME=$( dialog  --stdout  --title 'Nome' --inputbox 'Por favor, digite um nome para o cliente:' 0 0 )

# build keys
echo $CLINAME
cd easy-rsa 
. ./vars
./build-key $CLINAME

# pack files
cd ..
rm -fr pack
mkdir pack/keys -p

CLI_CONFIG="pack/$SERVERNAME.conf"

cp etc/client.conf $CLI_CONFIG
sed -r "s#SERVERADDRESS#$SERVERADDRESS#g" -i $CLI_CONFIG
sed -r "s#CLIENT#$CLINAME#g" -i $CLI_CONFIG

cp easy-rsa/keys/ca.crt pack/keys/
cp easy-rsa/keys/$CLINAME.crt pack/keys/
cp easy-rsa/keys/$CLINAME.key pack/keys/
cp easy-rsa/keys/ta.key pack/keys/

cp $CLI_CONFIG $(echo $CLI_CONFIG | sed -r 's#\.conf#.ovpn#g')

cd pack
zip -r ../$CLINAME.zip *
cd ..
cp $CLINAME.zip bkp
