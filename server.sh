#/bin/bash
source utils.sh

# create certificates
cd easy-rsa 
. ./vars
./clean-all
echo "Criando certificado CA"
./build-ca
echo "Criando certificado para o servidor"
./build-key-server server
echo "Criando parametros Diffie Hellman" 
./build-dh
echo "Criando chave para tls-auth" 
openvpn --genkey --secret ta.key
mv ta.key keys

echo "Movendo todos os arquivos necessários para /etc/openvpn e reiniciando OpenVPN" 
cp ../etc/server.conf /etc/openvpn/
mkdir /etc/openvpn/keys -p
cp keys/ca.crt /etc/openvpn/keys
cp keys/server.crt /etc/openvpn/keys
cp keys/server.key /etc/openvpn/keys 
cp keys/dh1024.pem /etc/openvpn/keys
cp keys/ta.key /etc/openvpn/keys


useradd nobody
groupadd nobody
/etc/init.d/openvpn restart
