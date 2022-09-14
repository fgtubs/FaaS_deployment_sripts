# start from a fresh installed Ubuntu server 22.01 LTS 

sudo apt-get update
sudo apt-get upgrade

# install docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo service docker start

sudo groupadd docker
sudo gpasswd -a $USER docker

DOCKERCHECK=$(docker run hello-world | grep 'Hello from Docker!')

if [ '$DOCKERCHECK'=='Hello from Docker!']
then
    echo "ok"
else
    echo "something went wrong, start again from clean ubuntu"
    exit
fi



# Install k3s with docker as a container runtime engine

curl -sfL https://get.k3s.io | sh -s - --docker
sudo chown ubuntu:ubuntu /etc/rancher/k3s/k3s.yaml
sudo apt install linux-modules-extra-raspi



# Install openfaas with arkade

    # Install arkade
curl -sLS https://get.arkade.dev | sudo sh
    # Install openfaas
arkade install openfaas

sudo reboot