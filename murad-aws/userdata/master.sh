#!/bin/bash

useradd -m sandy
dnf install sshpass -y
su - sandy --shell=/bin/bash -c 'ssh-keygen -q -N "" -f ~/.ssh/id_rsa'
su - sandy --shell=/bin/bash -c 'sshpass -p '123' ssh-copy-id -o StrictHostKeyChecking=no 172.31.0.11'
