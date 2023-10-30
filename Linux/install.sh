#!/bin/bash

# Import Ubuntu Dependecies Script
source ./Ubuntu/Ubuntu_22.04_Node_Enviroment_Setup.sh # Import the script file

read -p "Which OS you are using? (1) Ubuntu (2) CentOS (3) Debian (4) Other OS: " os # Ask user which OS they are using

if [ $os -eq 1]; then
    read -p "Which Ubuntu Version you are using? (1) 23.04 (2) 22.04 (3) 20.04 : " ubuntu_version # Ask user which Ubuntu Version they are using

    if [ $ubuntu_version -eq 1]; then
        echo "Installing Ubuntu 23.04 Dependencies" # If user choose Ubuntu 23.04, then run
        Ubuntu_23.04_Node_Enviroment_Setup
    elif [ $ubuntu_version -eq 2]; then
        echo "Installing Ubuntu 22.04 Dependencies" # If user choose Ubuntu 22.04, then run
        Ubuntu22.04NodeEnviromentSetup
    elif [ $ubuntu_version -eq 3]; then
        echo "Installing Ubuntu 20.04 Dependencies" # If user choose Ubuntu 20.04, then run
        Ubuntu_20.04_Node_Enviroment_Setup
    else
        echo "No Ubuntu Version Selected" # If user choose other Ubuntu Version, then run
        exit 1 # Exit with error code 1
    fi
elif [ $os -eq 2]; then
    echo "Installing CentOS Dependencies"
    CentOS_8_Node_Enviroment_Setup
elif [ $os -eq 3]; then
    echo "Installing Debian Dependencies"
    Debian_10_Node_Enviroment_Setup
else
    echo "No OS Selected"
    exit 1 # Exit with error code 1
fi
