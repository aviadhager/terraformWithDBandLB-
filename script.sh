
#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
sudo apt-get update
sudo apt install apache2 -y
sudo ufw allow 'Apache'
sudo systemctl enable apache2
# make sure nginx is started
sudo systemctl start apache2
