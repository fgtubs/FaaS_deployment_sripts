# Install openfaas with helm
# used documentation: https://github.com/openfaas/faas-netes/blob/master/chart/openfaas/README.md

# Install helm
curl -sSLf https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Create namespaces
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

# Make service accessible
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Add openfaas helm chart
helm repo add openfaas https://openfaas.github.io/faas-netes/

export TIMEOUT=5m
helm repo update \
 && helm upgrade openfaas --install openfaas/openfaas \
    --namespace openfaas  \
    --set functionNamespace=openfaas-fn \
    --set generateBasicAuth=true \
    --set gateway.upstreamTimeout=$TIMEOUT \
    --set gateway.writeTimeout=$TIMEOUT \
    --set gateway.readTimeout=$TIMEOUT \
    --set faasnetes.writeTimeout=$TIMEOUT \
    --set faasnetes.readTimeout=$TIMEOUT \
    --set queueWorker.ackWait=$TIMEOUT \
    --set gateway.nodePort=30080
    
# Receive credantials
PASSWORD=$(kubectl -n openfaas get secret basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode) && \
echo "OpenFaaS admin password: $PASSWORD"

# Install openfaas cli
curl -sSL https://cli.openfaas.com | sudo -E sh

export OPENFAAS_URL=http://127.0.0.1:30080

sleep 3
# Login with the CLI and check connectivity
echo -n $PASSWORD | faas-cli login -g $OPENFAAS_URL -u admin --password-stdin
