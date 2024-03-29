#!/bin/bash

# Define the colors which will be used in the script
if [ -t 1 ]; then
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    GRAY=$(tput setaf 8)
    SAFERED=$(tput setaf 9)
    MAGENTA=$(tput setaf 5)
    BOLD=$(tput bold)
    NORMAL=$(tput sgr0)
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    GRAY=""
    SAFERED=""
    MAGENTA=""
    BOLD=""
    NORMAL=""
fi

# Define the directory path
DIRECTORY_PATH="/etc/nginx/conf.d/"

# Check if the directory is empty or not
if [ -n "$(ls -A $DIRECTORY_PATH)" ]; then
    echo "$RED Directory is not empty."

    # Ask User is user want to overwrite all nginx config file from /etc/nginx/conf.d/ or not
    read -p "$YELLOW $BOLD Do you went to overwrite all nginx config file from /etc/nginx/conf.d/ (y/n): " OVERWRITE # Get OVERWRITE

    # Check if user want to overwrite all nginx config file from /etc/nginx/conf.d/ or not
    if [ "$OVERWRITE" == "y" ] || [ "$OVERWRITE" == "Y" ]; then
        echo "$RED Removing all nginx config file from /etc/nginx/conf.d/"

        # Delete all nginx config file from /etc/nginx/conf.d/
        sudo rm -r /etc/nginx/conf.d/* # Remove all nginx config file from /etc/nginx/conf.d/
        echo "$GREEN All nginx config file from /etc/nginx/conf.d/ is removed."

        # Copy nginx config file project wise to /etc/nginx/sites-available/
        sudo cp Conf/* /etc/nginx/conf.d/ # Copy nginx config file project wise to /etc/nginx/conf.d/

        echo "$YELLOW $BOLD All nginx config file from Conf/ is copied to /etc/nginx/conf.d/"

    else
        echo "$BOLD $MAGENTA No need to remove all nginx config file from /etc/nginx/conf.d/"
    fi
else
    echo "$GREEN Directory is empty."
    # Copy nginx config file project wise to /etc/nginx/sites-available/
    sudo cp Conf/* /etc/nginx/conf.d/ # Copy nginx config file project wise to /etc/nginx/conf.d/
    echo "$YELLOW $BOLD All Conf/ nginx config file is copied to /etc/nginx/conf.d/"
fi

# Start nginx
sudo nginx -t                # Test nginx config
sudo systemctl enable nginx  # Enable nginx
sudo systemctl restart nginx # Restart nginx when restarting

## issue ssl certificate
#All Domain Name for SSL Issue
read -p "$YELLOW $BOLD You need SSL Certificate? (y/n): " SSL # Get SSL Certificate

if [ "$SSL" = "y" ]; then
    sudo certbot --nginx --redirect # Issue SSL Certificate for all domain name
else
    echo "$RED No SSL Certificate Issued"
fi

# Enable Certbot Auto Renewal
sudo systemctl enable certbot.timer  # Enable Certbot Auto Renewal
sudo systemctl restart certbot.timer # Start Certbot Auto Renewal

# End of Script
echo "$BOLD $GREEN Server Ready With Nginx Setup 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script
