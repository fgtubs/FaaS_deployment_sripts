# Installation of OpenWhisk 

# Install helm
curl -sSLf https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Make service accessible
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

cat << EOF > mycluster.yaml
affinity:
  enabled: false

toleration:
  enabled: false

invoker:
  options: "-Dwhisk.kubernetes.user-pod-node-affinity.enabled=false"
EOF

helm repo add openwhisk https://openwhisk.apache.org/charts
helm repo update
helm install owdev openwhisk/openwhisk -n openwhisk --create-namespace -f mycluster.yaml


# get wsk, cli
wget https://github.com/apache/openwhisk-cli/releases/download/1.2.0/OpenWhisk_CLI-1.2.0-linux-arm64.tgz
sudo tar -xzf OpenWhisk_CLI-1.2.0-linux-arm64.tgz

sudo mv wsk /usr/local/bin/wsk


# configure wsk
wsk property set --apihost :31001
wsk property set --auth 23bc46b1-71f6-4ed5-8c54-816aa4f8c502:123zO3xZCLrMN6v2BKK1dXYFpXlPkccOFqm12CdAsMgRU4VrNZ9lyGVCGuMDGIwP
