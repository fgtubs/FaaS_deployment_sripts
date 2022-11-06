# install docker with 'docker.sh'

# install nodejs
sudo snap install node --classic --channel=14
# install java
sudo apt install default-jdk

# install playground
git clone https://github.com/apache/openwhisk.git
cd openwhisk
./gradlew core:standalone:bootRun

wget https://github.com/apache/openwhisk-cli/releases/download/1.2.0/OpenWhisk_CLI-1.2.0-linux-arm64.tgz
sudo tar -xzf OpenWhisk_CLI-1.2.0-linux-arm64.tgz

sudo mv wsk /usr/local/bin/wsk
