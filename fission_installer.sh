# Prerequirements: install k3s with script

# Install helm
curl -sSLf https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
# Make service accessible
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml


# install fission
export FISSION_NAMESPACE="fission"
kubectl create namespace $FISSION_NAMESPACE
kubectl create -k "github.com/fission/fission/crds/v1?ref=v1.17.0"
helm repo add fission-charts https://fission.github.io/fission-charts/
helm repo update
helm install --version v1.17.0 --namespace $FISSION_NAMESPACE fission fission-charts/fission-all

# install fission cli
curl -Lo fission https://github.com/fission/fission/releases/download/v1.17.0/fission-v1.17.0-linux-arm64 \
    && chmod +x fission && sudo mv fission /usr/local/bin/
