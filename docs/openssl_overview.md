from Guide: https://jamielinux.com/docs/openssl-certificate-authority/index.html

# Overview
```
openssl genrsa -aes256 -out private/ca.key.pem 4096
openssl req -config openssl.cnf -key private/ca.key.pem -new -x509 -days 8400 -sha256 -extensions v3_ca -out certs/ca.cert.pem
openssl req -config openssl.cnf -key private/ca.key.pem -new -x509 -days 8400 -sha256 -extensions v3_ca -out certs/ca.cert.pem
openssl x509 -noout -text -in certs/ca.cert.pem
openssl genrsa -aes256 -out intermediate/private/intermediate.key.pem 4096
openssl genrsa -aes256 -out intermediate/private/intermediate.key.pem 4096
openssl req -config intermediate/openssl.cnf -new -sha256 -key intermediate/private/intermediate.key.pem -out intermediate/csr/intermediate.csr.pem
openssl ca -config openssl.cnf -extensions v3_intermediate_ca -days 3650 -notext -md sha256 -in intermediate/csr/intermediate.csr.pem -out intermediate/certs/intermediate.cert.pem
openssl x509 -noout -text -in intermediate/certs/intermediate.cert.pem 
openssl verify -CAfile certs/ca.cert.pem intermediate/certs/intermediate.cert.pem 
openssl genrsa -aes256 -out intermediate/private/www.example.com.key.pem 2048
openssl req -config intermediate/openssl.cnf -key intermediate/private/www.example.com.key.pem -new -sha256 -out intermediate/csr/www.example.com.csr.pem
openssl ca -config intermediate/openssl.cnf -extensions server_cert -days 375 -notext -md sha256 -in intermediate/csr/www.example.com.csr.pem -out intermediate/certs/www.example.com.cert.pem
openssl x509 -text -in intermediate/certs/www.example.com.cert.pem 
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem intermediate/certs/www.example.com.cert.pem 
```


## create key (just private key, public key comes from certificate)

```
openssl genrsa -aes256 -out intermediate/private/www.example.com.key.pem 2048
```

## create public key (=certificate sign request)

```
openssl req -config intermediate/openssl.cnf -key intermediate/private/www.example.com.key.pem -new -sha256 -out intermediate/csr/www.example.com.csr.pem
```

## sign public key (create certificate)

```
openssl ca -config intermediate/openssl.cnf -extensions server_cert -days 375 -notext -md sha256 -in intermediate/csr/www.example.com.csr.pem -out intermediate/certs/www.example.com.cert.pem
```

## create certiifcate chain

Just paste all certificates belonging to the chain into a text file


# actual tasks

## self sign certificate

 1. create key
 2. request certificate for key (= create csr)
 3. sign csr with key

## create a ca

 1. create self signed certificate for a CA
 2. make sure people have access to your certificate
 3. probably should create intermediate CA to keep root key more save

## Create intermediate CA

 1. create key
 2. create csr
 3. sign csr with root CA key
 4. create certificate-chain

## Create Certificate that is trusted by CA

 1. create key
 2. create csr
 3. let ca sign csr (or sign yourself if you are CA)
 4. receive certificate from CA, and probably cert-chain
 5. restart your software with references to your own certificate, and the
    cert-chain

## Handle a simple internal web app

 1. create self signed certificate

## Have clients authenticate as well

 1. create CA
 2. create 2x certificate that is trusted by CA

## Have N multiple peers that require secure communication

 1. create CA
 2. create Nx certificate that is trusted by CA
