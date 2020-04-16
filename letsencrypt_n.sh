
#!/bin/bash

sudo cp -f default /etc/nginx/sites-enabled/default

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install certbot python-certbot-nginx -y
sudo certbot --nginx

sudo crontab -e
