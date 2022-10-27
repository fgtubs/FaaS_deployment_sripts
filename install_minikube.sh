# First install docker with the script

sudo apt update

# install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64
sudo install minikube-linux-arm64 /usr/local/bin/minikube

minikube start

# to access cluster: minikube kubectl -- get po -A
