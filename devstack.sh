#!/bin/bash
echo "Install OpenStack devstack Requirements"
echo "========================================"

sudo apt update
sudo apt install git -y
sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

sudo -u stack -H sh -c "cd ~;git clone https://opendev.org/openstack/devstack -b stable/stein"

devstack="/opt/stack/devstack"
if [ -e $devstack ]; then
	echo "Installation Success"
else 
	echo "Installation not Success"
fi 

sudo su - stack