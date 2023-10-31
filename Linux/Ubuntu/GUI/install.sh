InstallGUI() {
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

    # Perform GUI-related tasks here
    echo "$YELLOW Installing GUI..."
    echo "$GREEN Choose an option:"
    echo "$BLOD 1. Install GUI via Tasksel"
    echo "$BOLD 2. Install GUI via apt"
    read choice

    if [ "$choice" == "1" ]; then
        # Perform tasks for GUI installation
        sudo apt update             # update apt
        sudo apt install tasksel -y # install tasksel
        sudo tasksel                # Select the GUI you want to install
    elif [ "$choice" == "2" ]; then
        echo "$YELLOW Choose an option:"
        echo "$BOLD 1. Install GNOME"
        echo "$BOLD 2. Install Xfce"
        read choice

        if [ "$choice" == "1" ]; then
            # Perform tasks for GUI installation
            sudo apt update                                      # update apt
            sudo apt install ubuntu-desktop -y                   # install ubuntu desktop
            sudo apt install lightdm -y                          # install lightdm
            sudo /usr/lib/lightdm/lightdm-set-defaults -s ubuntu # set default desktop to ubuntu

        elif [ "$choice" == "2" ]; then
            # Perform tasks for Xfce installation
            sudo apt update                                    # update apt
            sudo apt install xfce4 -y                          # install xfce4
            sudo apt install lightdm -y                        # install lightdm
            sudo /usr/lib/lightdm/lightdm-set-defaults -s xfce # set default desktop to xfce

        else
            echo "$RED Invalid choice."
        fi

    else
        echo "$RED Invalid choice."
    fi

    # Install XRDP
    sudo apt install xrdp -y   # install xrdp
    sudo systemctl enable xrdp # enable xrdp
}
