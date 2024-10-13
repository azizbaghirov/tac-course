#!/bin/bash

useradd -m sandy
sed -i 's/no/yes/g' /etc/ssh/sshd_config.d/50-cloud-init.conf
systemctl restart sshd
echo 123 | passwd --stdin sandy
echo 'sandy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/sandy
chmod 440 /etc/sudoers.d/sandy

# Add SSH key for sandy
mkdir -p /home/sandy/.ssh
chown -R sandy:sandy /home/sandy/.ssh
chmod 700 /home/sandy/.ssh
chmod 600 /home/sandy/.ssh/authorized_keys
