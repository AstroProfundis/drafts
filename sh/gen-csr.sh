#!/bin/bash
echo "Input the domain:"
read domain

mkdir "$domain"
cd "$domain"

echo "Generating Key and CSR..."
openssl ecparam -out "$domain".key -name prime256v1 -genkey
openssl req -out "$domain".csr -new -nodes -key "$domain".key -sha384

echo "The CSR is:"
cat "$domain".csr
