#!/bin/bash

# Import Ubuntu Dependencies Script
source ./Ubuntu/Ubuntu_22.04_Node_Enviroment_Setup.sh # Import the script file
source ./Ubuntu/Ubuntu_20.04_Node_Enviroment_Setup.sh # Import the script file
source ./Ubuntu/Ubuntu_23.04_Node_Enviroment_Setup.sh # Import the script file

read -p "Which OS you are using? (1) Ubuntu (2) CentOS (3) Debian (4) Other OS: " os # Ask the user which OS they are using

if [ "$os" == "1" ]; then
    read -p "Which Ubuntu Version are you using? (1) 23.04 (2) 22.04 (3) 20.04: " ubuntu_version # Ask the user which Ubuntu Version they are using

    if [ "$ubuntu_version" == "1" ]; then
        echo "Installing Ubuntu 23.04 Dependencies" # If the user chooses Ubuntu 23.04, then run
        Ubuntu23.04NodeEnviromentSetup
    elif [ "$ubuntu_version" == "2" ]; then
        echo "Installing Ubuntu 22.04 Dependencies" # If the user chooses Ubuntu 22.04, then run
        Ubuntu22.04NodeEnviromentSetup
    elif [ "$ubuntu_version" == "3" ]; then
        echo "Installing Ubuntu 20.04 Dependencies" # If the user chooses Ubuntu 20.04, then run
        Ubuntu20.04NodeEnviromentSetup
    else
        echo "No Ubuntu Version Selected" # If the user chooses another Ubuntu Version, then run
        exit 1                            # Exit with error code 1
    fi
elif [ "$os" == "2" ]; then
    echo "Installing CentOS Dependencies"
    CentOS_8_Node_Enviroment_Setup
elif [ "$os" == "3" ]; then
    echo "Installing Debian Dependencies"
    Debian_10_Node_Enviroment_Setup
else
    echo "No OS Selected"
    exit 1 # Exit with error code 1
fi
