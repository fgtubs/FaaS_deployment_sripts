# install docker with script

curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.17.0/kind-$(uname)-arm64"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

wget https://github.com/knative/client/releases/download/knative-v1.8.1/kn-linux-arm64
mv kn-linux-arm64 kn
chmod +x kn
sudo mv kn /usr/local/bin

wget https://github.com/knative-sandbox/kn-plugin-quickstart/releases/download/knative-v1.8.1/kn-quickstart-linux-arm64
mv kn-quickstart-amr64 kn-quickstart
chmod +x kn-quickstart
sudo mv kn-quickstart /usr/local/bin


echo starting kind cluster
kn quickstart kind

echo For first try functions: https://knative.dev/docs/getting-started/first-service/
