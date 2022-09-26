sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
sudo systemctl restart dbus.service irqbalance.service ModemManager.service multipathd.service networkd-dispatcher.service polkit.service packagekit.service polkit.service ssh.service systemd-logind.service thermald.service udisks2.service unattended-upgrades.service user@1000.service rsyslog.service cron.service systemd-journald.service systemd-manager systemd-networkd.service systemd-resolved.service systemd-timesyncd.service systemd-udevd.service user@1000.service

# Install k3s with containerd as a container runtime engine

curl -sfL https://get.k3s.io | sh -
sudo chown ubuntu:ubuntu /etc/rancher/k3s/k3s.yaml
sudo apt install -y linux-modules-extra-raspi
sudo reboot
