sudo DEBIAN_FRONTEND=noninteractive apt-get update
#sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
#sudo systemctl restart dbus.service irqbalance.service ModemManager.service multipathd.service networkd-dispatcher.service polkit.service packagekit.service polkit.service ssh.service systemd-logind.service thermald.service udisks2.service unattended-upgrades.service user@1000.service rsyslog.service cron.service systemd-journald.service systemd-manager systemd-networkd.service systemd-resolved.service systemd-timesyncd.service systemd-udevd.service user@1000.service
sudo systemctl restart packagekit.service

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
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo service docker start

# make docker accessible by non sudo user
sudo groupadd docker
sudo gpasswd -a $USER docker

# reboot, so that the permission changes are activated
sudo reboot
