# Transfer nginx config file project wise to /etc/nginx/sites-available/
sudo cp Conf/* /etc/nginx/sites-available/ # Transfer all nginx config file to /etc/nginx/sites-available/

# Create Symbolic Link for nginx config file
sudo ln -s /etc/nginx/sites-available/'Store Management App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Store Management App Nginx Router
sudo ln -s /etc/nginx/sites-available/'Portfolio App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Portfolio App Nginx Router
sudo ln -s /etc/nginx/sites-available/'SaveNet App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for SaveNet App Nginx Router
sudo ln -s /etc/nginx/sites-available/'Video Downloader App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Video Downloader App Nginx Router
sudo ln -s /etc/nginx/sites-available/'University Result App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for University Result App Nginx Router
sudo ln -s /etc/nginx/sites-available/'Donation Tracker App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Donation Tracker App Nginx Router
sudo ln -s /etc/nginx/sites-available/'PaisaPay Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for PaisaPay Nginx Router

# Start nginx
sudo nginx -t # Test nginx config
sudo systemctl enable nginx # Enable nginx
sudo systemctl restart nginx # Restart nginx

## issue ssl certificate
read -p "Enter Domain Name For SSL Issue (without https/http): " domain # Domain Name for SSL Issue (without https/http)

 #All Domain Name for SSL Issue
sudo certbot --nginx --redirect -d store.$domain # Store Management App
sudo certbot --nginx --redirect -d $domain # Portfolio App
sudo certbot --nginx --redirect -d docs.$domain # SaveNet App
sudo certbot --nginx --redirect -d video.$domain # Video Downloader App
sudo certbot --nginx --redirect -d result.$domain # University Result App
sudo certbot --nginx --redirect -d donate.$domain # Donation Tracker App
sudo certbot --nginx --redirect -d paisapay.$domain # PaisaPay App

# Enable Certbot Auto Renewal
sudo systemctl enable certbot.timer # Enable Certbot Auto Renewal
sudo systemctl restart certbot.timer # Start Certbot Auto Renewal

# End of Script
echo "Server Ready With Nginx Setup 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script