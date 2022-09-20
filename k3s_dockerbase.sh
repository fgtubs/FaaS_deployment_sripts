# Install k3s with docker as a container runtime engine

curl -sfL https://get.k3s.io | sh -s - --docker
sudo chown ubuntu:ubuntu /etc/rancher/k3s/k3s.yaml
sudo apt install -y linux-modules-extra-raspi
sudo reboot
