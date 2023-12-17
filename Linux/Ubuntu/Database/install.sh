InstallDatabase() {
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

    # Install MySQL
    read -p "$BOLD Do you want to install MySQL? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        echo "$NORMAL$BOLD Installing MySQL... $NORMAL"
        # Install MySQL
        sudo apt install mysql-server -y # install mysql-server
        sudo systemctl enable mysql      # enable mysql
        sudo systemctl start mysql       # start mysql
    else
        echo "$NORMAL$BOLD Skipping MySQL installation... $NORMAL"
    fi

    # Install PostgreSQL
    read -p "$BOLD Do you want to install PostgreSQL? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        echo "$NORMAL$BOLD Installing PostgreSQL... $NORMAL"
        # Install PostgreSQL
        sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' # add repo for postgresql
        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -                                         # add key for postgresql
        sudo apt-get update                                                                                                               # update apt
        sudo apt-get -y install postgresql                                                                                                # install postgresql
        sudo systemctl enable postgresql                                                                                                  # enable postgresql
        sudo systemctl start postgresql
    else
        echo "$NORMAL$BOLD Skipping PostgreSQL installation... $NORMAL"
    fi

    # Install cassandra
    read -p "$BOLD Do you want to install cassandra? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        echo "$NORMAL$BOLD Installing cassandra... $NORMAL"
        # Apache Cassandra Installation
        echo "deb https://debian.cassandra.apache.org 41x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list # add repo for cassandra
        deb https://debian.cassandra.apache.org 41x main                                                                     # add repo for cassandra
        curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -                                                # add key for cassandra
        sudo apt-get update                                                                                                  # update apt
        sudo apt-get install cassandra -y                                                                                    # install cassandra
        sudo systemctl enable cassandra                                                                                      # enable cassandra
        sudo systemctl start cassandra
    else
        echo "$NORMAL$BOLD Skipping cassandra installation... $NORMAL"
    fi

    # Install Redis
    read -p "$BOLD Do you want to install Redis? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        echo "$NORMAL$BOLD Installing Redis... $NORMAL"
        # Install Redis
        sudo apt install redis-server -y # install redis-server
        sudo systemctl enable redis      # enable redis
        sudo systemctl start redis       # start redis
    else
        echo "$NORMAL$BOLD Skipping Redis installation... $NORMAL"
    fi
}
