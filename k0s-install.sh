# Install k0s on a Raspberry Pi

sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
sudo systemctl restart dbus.service irqbalance.service ModemManager.service multipathd.service networkd-dispatcher.service polkit.service packagekit.service polkit.service ssh.service systemd-logind.service thermald.service udisks2.service unattended-upgrades.service user@1000.service rsyslog.service cron.service systemd-journald.service systemd-manager systemd-networkd.service systemd-resolved.service systemd-timesyncd.service systemd-udevd.service user@1000.service

sudo apt install -y linux-modules-extra-raspi

curl -sSLf https://get.k0s.sh | sudo sh
sudo k0s install controller --single
sudo k0s start

# make it accessible without sudo
sudo chown ubuntu:ubuntu /var/lib/k0s/pki/admin.conf
