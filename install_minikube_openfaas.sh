# First install docker with the script

sudo apt update

# install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64
sudo install minikube-linux-arm64 /usr/local/bin/minikube

minikube start

# to access cluster: minikube kubectl -- get po -A

minikube kubectl get nodes

alias kubectl="minikube kubectl --"

# install openfaas

curl -sSLf https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# https://faun.pub/getting-started-with-openfaas-on-minikube-634502c7acdf
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
helm repo add openfaas https://openfaas.github.io/faas-netes/
helm repo update
helm repo add openfaas https://openfaas.github.io/faas-netes/
export PASSWORD=$(head -c 12 /dev/urandom | shasum| cut -d' ' -f1)
echo $PASSWORD
kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=admin --from-literal=basic-auth-password="$PASSWORD"
helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set functionNamespace=openfaas-fn --set basic_auth=true

curl -sSL https://cli.openfaas.com | sudo -E sh
export OPENFAAS_URL=$(minikube ip):31112

echo "sleeping for 1 min, so all pods can start"
sleep 1min
echo -n $PASSWORD | faas-cli login -g $OPENFAAS_URL -u admin --password-stdin

echo "if last command let to error, wait another minute and run this again: echo -n $PASSWORD | faas-cli login -g $OPENFAAS_URL -u admin --password-stdin"
