echo "Input the domain:"
read domain

mkdir $domain
cd $domain

echo "Generating CSR"
openssl req -out "$domain".csr -new -newkey rsa:2048 -nodes -keyout "$domain".key

echo "The CSR is:"
cat "$domain".csr
