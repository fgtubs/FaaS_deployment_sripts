# install docker with script

curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.17.0/kind-$(uname)-arm64"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
