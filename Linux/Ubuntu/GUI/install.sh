InstallGUI() {
    # Perform GUI-related tasks here
    echo "Installing GUI..."
    echo "Choose an option:"
    echo "1. Install GUI via Tasksel"
    echo "2. Install GUI via apt"
    read choice

    if [ "$choice" == "1" ]; then
        # Perform tasks for GUI installation
        sudo apt update             # update apt
        sudo apt install tasksel -y # install tasksel
        sudo tasksel                # Select the GUI you want to install
        sudo reboot                 # reboot
    elif [ "$choice" == "2" ]; then
        echo "Choose an option:"
        echo "1. Install GNOME"
        echo "2. Install Xfce"
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
            echo "Invalid choice."
        fi

    else
        echo "Invalid choice."
    fi

    # Install XRDP
    sudo apt install xrdp -y   # install xrdp
    sudo systemctl enable xrdp # enable xrdp
}
