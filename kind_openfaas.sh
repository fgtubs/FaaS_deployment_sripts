# install docker with script

curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.17.0/kind-$(uname)-arm64"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# https://docs.openfaas.com/tutorials/local-kind-registry/

curl -sLS https://get.arkade.dev | sudo sh

arkade get kubectl
sudo mv /home/ubuntu/.arkade/bin/kubectl /usr/local/bin/

cat << EOFF > kind-with-registry.sh
#!/bin/sh
set -o errexit

# create registry container unless it already exists
reg_name='kind-registry'
reg_port='5000'
running="$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)"
if [ "${running}" != 'true' ]; then
  docker run \
    -d --restart=always -p "${reg_port}:5000" --name "${reg_name}" \
    registry:2
fi

# create a cluster with the local registry enabled in containerd
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
containerdConfigPatches:
- |-
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:${reg_port}"]
    endpoint = ["http://${reg_name}:${reg_port}"]

# connect the registry to the cluster network
docker network connect "kind" "${reg_name}"

# tell https://tilt.dev to use the registry
# https://docs.tilt.dev/choosing_clusters.html#discovering-the-registry
for node in $(kind get nodes); do
  kubectl annotate node "${node}" "kind.x-k8s.io/registry=localhost:${reg_port}";
done
EOFF

chmod +x kind-with-registry.sh
./kind-with-registry.sh
kubectl config current-context
kubectl config use kind-kind
kubectl cluster-info
docker logs -f kind-registry
arkade install openfaas
kubectl rollout status -n openfaas deploy/gateway
kubectl port-forward -n openfaas svc/gateway 8080:8080 &
arkade get faas-cli
sudo mv /home/ubuntu/.arkade/bin/faas-cli /usr/local/bin/
