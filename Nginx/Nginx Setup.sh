# Delete all nginx config file from /etc/nginx/conf.d/
sudo  rm -r /etc/nginx/conf.d/* # Remove all nginx config file from /etc/nginx/conf.d/

# Copy nginx config file project wise to /etc/nginx/sites-available/
sudo cp Conf/* /etc/nginx/conf.d/ # Copy nginx config file project wise to /etc/nginx/conf.d/

# Start nginx
sudo nginx -t # Test nginx config
sudo systemctl enable nginx # Enable nginx
sudo systemctl restart nginx # Restart nginx

## issue ssl certificate
 #All Domain Name for SSL Issue
read -p "You need SSL Certificate? (y/n): " SSL # Get SSL Certificate

if [ "$SSL" = "y" ]; then
    sudo certbot --nginx --redirect # Issue SSL Certificate for all domain name
fi

# Enable Certbot Auto Renewal
sudo systemctl enable certbot.timer # Enable Certbot Auto Renewal
sudo systemctl restart certbot.timer # Start Certbot Auto Renewal

# End of Script
echo "Server Ready With Nginx Setup 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script