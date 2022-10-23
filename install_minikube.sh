# insatll kvm/libvirt as a hypervisor

sudo apt update
sudo apt install -y linux-modules-extra-raspi
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo adduser $USER kvm



# install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64
sudo install minikube-linux-arm64 /usr/local/bin/minikube

# make it easier to access
alias kubectl="minikube kubectl --"

sudo reboot

# run: minikube start --driver=kvm2
