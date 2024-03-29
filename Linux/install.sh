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

# Import Ubuntu Dependencies Script
source ./Ubuntu/Ubuntu_22.04_Node_Enviroment_Setup.sh # Import the script file
source ./Ubuntu/Ubuntu_20.04_Node_Enviroment_Setup.sh # Import the script file
source ./Ubuntu/Ubuntu_23.04_Node_Enviroment_Setup.sh # Import the script file

# Import Database Installation Script
source ./Ubuntu/Database/install.sh # Import the script file

# Import Compiler Installation Script
source ./Ubuntu/Compiler/install.sh # Import the script file

# Import GUI Installation Script
source ./Ubuntu/GUI/install.sh # Import the script file

read -p "$BOLD Which OS you are using? (1) Ubuntu (2) Debian (3) Other OS: " os # Ask the user which OS they are using

if [ "$os" == "1" ]; then
    read -p "$GREEN Which Ubuntu Version are you using? (1) 23.04 (2) 22.04 (3) 20.04: " ubuntu_version # Ask the user which Ubuntu Version they are using

    if [ "$ubuntu_version" == "1" ]; then
        echo "$YELLOW Installing Ubuntu 23.04 Dependencies" # If the user chooses Ubuntu 23.04, then run
        Ubuntu23.04NodeEnviromentSetup
    elif [ "$ubuntu_version" == "2" ]; then
        echo "$YELLOW Installing Ubuntu 22.04 Dependencies" # If the user chooses Ubuntu 22.04, then run
        Ubuntu22.04NodeEnviromentSetup
    elif [ "$ubuntu_version" == "3" ]; then
        echo "$YELLOW Installing Ubuntu 20.04 Dependencies" # If the user chooses Ubuntu 20.04, then run
        Ubuntu20.04NodeEnviromentSetup
    else
        echo "$RED No Ubuntu Version Selected" # If the user chooses another Ubuntu Version, then run
        exit 1                                 # Exit with error code 1
    fi
elif [ "$os" == "2" ]; then
    echo "$YELLOW You can use Ubuntu Script for Debian as ubuntu is based on Debian" # If the user chooses Debian, then run
else
    echo "$RED Currently not supported" # If the user chooses another OS, then run
    exit 1                              # Exit with error code 1 when the user chooses another OS in selection
fi
