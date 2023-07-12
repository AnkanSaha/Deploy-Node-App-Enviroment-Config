# Transfer nginx config file project wise to /etc/nginx/sites-available/
sudo  rm -r /etc/nginx/sites-available/* # Remove all nginx config file from /etc/nginx/sites-available/
sudo rm -r /etc/nginx/sites-enabled/* # Remove all nginx config file from /etc/nginx/sites-enabled/

# Copy nginx config file project wise to /etc/nginx/sites-available/
sudo cp Conf/* /etc/nginx/sites-available/ # Copy nginx config file project wise to /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/ # Create symbolic link for nginx config file from /etc/nginx/sites-available/ to /etc/nginx/sites-enabled/

# Start nginx
sudo nginx -t # Test nginx config
sudo systemctl enable nginx # Enable nginx
sudo systemctl restart nginx # Restart nginx

## issue ssl certificate
 #All Domain Name for SSL Issue
sudo certbot --nginx --redirect # Issue SSL Certificate for all domain name

# Enable Certbot Auto Renewal
sudo systemctl enable certbot.timer # Enable Certbot Auto Renewal
sudo systemctl restart certbot.timer # Start Certbot Auto Renewal

# End of Script
echo "Server Ready With Nginx Setup 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script