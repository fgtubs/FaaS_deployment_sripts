sudo apt-get update
sudo apt-get -y upgrade

# install docker
sudo apt-get -y install \
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

# make docker accessible by non sudo user
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
