# FaaS_deployment_sripts

The aim of this project is to work on different deployment techinques for faas systems on constrained devices.
For this purpose the installation is done on a Raspberry Pi 4 with Ubuntu Server OS

## Installation builds
* Docker, K3s, openfaas
* containerd, K3s, openfaas
* faasd?
* tbd 

## Successfully deploy 
* Docker, K3s, openfaas
  * by following: 
```
  ./docker.sh
  ./k3s_dockerbase.sh
  ./openfaas.sh
```


## For testing and verifying
A simple hello world function is just to verify the build.
The function is from this project: https://github.com/fcarp10/openfaas-functions#1-hello-world
When the function is called it will return: 
```
<h1>Hello, World!</h1>
```
Also a web client is accessable:
* IP_RASPI:30080
* user: admin
* password: generated in the installation process
