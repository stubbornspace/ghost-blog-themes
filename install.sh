## Install script for ubuntu 22.04

apt update -y

## AWS CLI
sudo apt -y install unzip curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

## Nginx
sudo apt install -y nginx
apt install certbot python3-certbot-nginx -y


## NodeJS
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update -y
sudo apt-get install nodejs -y

## GHOST
sudo npm install ghost-cli@latest -g
sudo apt install sqlite3
sudo mkdir -p /var/www/ghost
sudo chown -R ubuntu:ubuntu /var/www/ghost
sudo chmod -R 755 /var/www/ghost

cd /var/www/ghost
ghost install local
cp /home/ubuntu/cantina-theme /var/www/ghost/

## Configure Nginx
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo cp /home/ubuntu/nginx.conf /etc/nginx/sites-available/default
sudo systemctl restart nginx
sudo systemctl enable nginx

## Certbot
sudo certbot --nginx -d chefcantina.com -d www.chefcantina.com --non-interactive --agree-tos --email stubbornspace@gmail.com



