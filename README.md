# FaaS_deployment_sripts

The aim of this project is to work on different deployment techinques for faas systems on constrained devices.
For this purpose the installation is done on a Raspberry Pi 4 with Ubuntu Server OS

## Installation for underlying applications tested
* Docker
* Containerd
* Kubernetes
* K3s
* K0s
* Minikube
* Kind

## Successfully deployed
* Docker
* Containerd
* K3s
* K0s
* Minikube
* Kind

## Installation for serverless tested
* OpenFaas
* faasd
* OpenWhisk
* kubeless
* Fn Project
* OpenShift
* knative
* iron functions
* fission
* OpenLambda



## Successfully deployed
* Docker, K3s, openfaas
  * by following: 
```
  ./docker.sh
  ./k3s_dockerbase.sh
  ./openfaas.sh
```
* containerd, K3s, openfaas
  * by following:
```
  ./k3s_containerd.sh
  ./openfaas.sh
```
* faasd
  * by follwoing:
```
  ./faasd-installer.sh
```

* knative quickstart with kind
```
  ./docker.sh
  ./kind_knative.sh
```


* knative quickstart with minikube
```
  ./docker.sh
  ./minikube_knative.sh
```

### Troubleshooting for OpenFaaS
If openfaas is not accessible, because the connection get refused use a specific gateway-flag
--gateway 127.0.0.1:30080


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
* password: generated in the installation process by ./openfaas.sh
