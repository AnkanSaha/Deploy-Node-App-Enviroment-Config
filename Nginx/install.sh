# Import Nginx Setup from bin
source ./bin/NginxSetup.sh # source NginxSetup.sh

read -p "Are you want to install Nginx? (y/n): " nginx # Ask the user if they want to install Nginx

if [ "$nginx" == "y" ] || [ "$nginx" == "Y" ]; then
    NginxSetup "./bin/Conf" # If the user chooses to install Nginx, then run
else
    echo "No Nginx Installed" # If the user chooses not to install Nginx, then run
fi
