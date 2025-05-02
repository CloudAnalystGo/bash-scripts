#!/bin/bash

# Script for Creating a Web Server (Fedora Cloud 42)

# Step 1
sudo dnf update -y

# Step 2
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Step 3
# n/a

# Step 4
sudo mkdir -p /var/www/myOnlineSite/html # Replace "myOnlineSite" with any name
> /var/www/myOnlineSite/html/index.html
myHTMLString = "<!doctype html><html><head><title>"My blank slate"</title></head><body><p>"Hello from Fedora!"</p></body></html>"
cat myHTMLString > /var/www/myOnlineSite/html/index.html

# Step 5
> /etc/nginx/conf.d/myOnlineServer.conf
myServerConfig = "server { listen 80; server_name your.vm.ip.here; root /var/www/myOnlineSite/html; index index.html; }"
cat myServerConfig > /etc/nginx/conf.d/myOnlineServer.conf
sudo setenforce Permissive
sudo systemctl reload nginx
