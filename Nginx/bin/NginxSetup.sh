#!/bin/bash

NginxSetup() {
    # Define the directory path
    DIRECTORY_PATH="/etc/nginx/conf.d/"

    # Check if the directory is empty or not
    if [ -n "$(ls -A $DIRECTORY_PATH)" ]; then
        echo "Directory is not empty."
        # Delete all nginx config file from /etc/nginx/conf.d/
        sudo rm -r /etc/nginx/conf.d/* # Remove all nginx config file from /etc/nginx/conf.d/
        echo "All nginx config file from /etc/nginx/conf.d/ is removed."
    else
        echo "Directory is empty."
        echo "No need to remove all nginx config file from /etc/nginx/conf.d/"
    fi

    # Copy nginx config file project wise to /etc/nginx/sites-available/
    sudo cp Conf/* /etc/nginx/conf.d/ # Copy nginx config file project wise to /etc/nginx/conf.d/

    # Start nginx
    sudo nginx -t                # Test nginx config
    sudo systemctl enable nginx  # Enable nginx
    sudo systemctl restart nginx # Restart nginx

    ## issue ssl certificate
    #All Domain Name for SSL Issue
    read -p "You need SSL Certificate? (y/n): " SSL # Get SSL Certificate

    if [ "$SSL" = "y" ]; then
        sudo certbot --nginx --redirect # Issue SSL Certificate for all domain name
    else
        echo "No SSL Certificate Issued"
    fi

    # Enable Certbot Auto Renewal
    sudo systemctl enable certbot.timer  # Enable Certbot Auto Renewal
    sudo systemctl restart certbot.timer # Start Certbot Auto Renewal

    # End of Script
    echo "Server Ready With Nginx Setup 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script

}
