#!/bin/bash

# Script for Creating a Web Server (Ubuntu 24.02)

# Step 1: Update the system
sudo apt update -y

# Step 2: Install Nginx
sudo apt install nginx -y

# Step 3: Create the web directory
sudo mkdir -p /var/www/myOnlineSite/html # Replace "myOnlineSite" with any name

# Step 4: Create the index.html file
echo '<!doctype html><html><head><title>My blank slate</title></head><body><p>Hello from Ubuntu!</p></body></html>' | sudo tee /var/www/myOnlineSite/html/index.html > /dev/null

# Step 5: Create the Nginx server configuration
echo "server { listen 80; server_name your.vm.ip.here; root /var/www/myOnlineSite/html; index index.html; }" | sudo tee /etc/nginx/conf.d/myOnlineServer.conf > /dev/null

# Step 6: Reload Nginx to apply the configuration
sudo systemctl reload nginx
