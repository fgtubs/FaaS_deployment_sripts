# install docker with 'docker.sh'

sudo apt update

# install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64
sudo install minikube-linux-arm64 /usr/local/bin/minikube

# install kubectl
curl -sLS https://get.arkade.dev | sudo sh
arkade get kubectl
sudo mv /home/ubuntu/.arkade/bin/kubectl /usr/local/bin/

# install kn cli
wget https://github.com/knative/client/releases/download/knative-v1.8.1/kn-linux-arm64
mv kn-linux-arm64 kn
chmod +x kn
sudo mv kn /usr/local/bin

# install kn quickstart 
wget https://github.com/knative-sandbox/kn-plugin-quickstart/releases/download/knative-v1.8.1/kn-quickstart-linux-arm64
mv kn-quickstart-linux-arm64 kn-quickstart
chmod +x kn-quickstart
sudo mv kn-quickstart /usr/local/bin

minikube config set memory 3078
minikube tunnel --profile knative
