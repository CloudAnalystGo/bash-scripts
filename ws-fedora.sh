#!/bin/bash

# Script for Creating a Web Server (Fedora Cloud 42)

# Step 1: Update the system
sudo dnf update -y

# Step 2: Install and start Nginx
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Step 3: Create the web directory
sudo mkdir -p /var/www/myOnlineSite/html # Replace "myOnlineSite" with any name

# Step 4: Create the index.html file
echo '<!doctype html><html><head><title>My blank slate</title></head><body><p>Hello from Fedora!</p></body></html>' | sudo tee /var/www/myOnlineSite/html/index.html > /dev/null

# Step 5: Create the Nginx server configuration
echo "server { listen 80; server_name your.vm.ip.here; root /var/www/myOnlineSite/html; index index.html; }" | sudo tee /etc/nginx/conf.d/myOnlineServer.conf > /dev/null

# Step 6: Set SELinux to permissive mode (if needed)
sudo setenforce Permissive

# Step 7: Reload Nginx to apply the configuration
sudo systemctl reload nginx
