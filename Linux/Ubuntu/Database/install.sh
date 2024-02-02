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
        echo "$NORMAL $BOLD Installing MySQL... $NORMAL"

        # Ask user to enter the password for the MySQL root user
        read -s -p "Enter the password for the MySQL root user (default is 'root'): " mysql_root_password # ask user to enter the password for the MySQL root user
        read -p "Enter the port number for MySQL (default is '3306'): " mysql_port                        # ask user to enter the port number for MySQL

        # Check if the user has entered the root password & port number or not
        if [ -z "$mysql_root_password" ]; then
            echo "Password is not set. Using default password 'root'."
            mysql_root_password='root' # set default password for mysql
        else
            echo "Password is set to $mysql_root_password."
        fi

        # Check if user entered port number or not
        if [ -z "$mysql_port" ]; then
            echo "Port number is not set. Using default port number '3306'."
            mysql_port='3306' # set default port number for mysql
        else
            echo "Port number is set to $mysql_port."
        fi

        # install mysql in docker
        docker run -d -p $mysql_port:3306 --name mysql -e MYSQL_ROOT_PASSWORD=$mysql_root_password mysql:latest # install mysql in docker

    else
        echo "$NORMAL $BOLD Skipping MySQL installation... $NORMAL"
    fi

    # Install PostgreSQL
    read -p "$BOLD Do you want to install PostgreSQL? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        echo "$NORMAL $BOLD Installing PostgreSQL... $NORMAL"

        # Ask user to enter the password for the PostgreSQL root user
        read -s -p "Enter the password for the PostgreSQL root user (default is 'root'): " postgresql_root_password # ask user to enter the password for the PostgreSQL root user
        read -p "Enter the port number for PostgreSQL (default is '5432'): " postgresql_port                        # ask user to enter the port number for PostgreSQL

        # Check if the user has entered the root password & port number or not
        if [ -z "$postgresql_root_password" ]; then
            echo "Password is not set. Using default password 'root'."
            postgresql_root_password='root' # set default password for postgresql
        else
            echo "Password is set to $postgresql_root_password."
        fi

        # Check if user entered port number or not
        if [ -z "$postgresql_port" ]; then
            echo "Port number is not set. Using default port number '3306'."
            postgresql_port='3306' # set default port number for postgresql
        else
            echo "Port number is set to $postgresql_port."
        fi

        # install postgresql in docker
        docker run -d -p $postgresql_port:5432 --name postgresql -e POSTGRES_PASSWORD=$postgresql_root_password postgres:latest # install postgresql in docker

    else
        echo "$NORMAL $BOLD Skipping PostgreSQL installation... $NORMAL"
    fi

    # Install cassandra
    read -p "$BOLD Do you want to install cassandra? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then

        # Ask user to enter the Port number for cassandra
        read -p "Enter the port number for cassandra (default is '9042'): " cassandra_port # ask user to enter the port number for cassandra

        # Check if user entered port number or not
        if [ -z "$cassandra_port" ]; then
            echo "Port number is not set. Using default port number '9042'."
            cassandra_port='9042' # set default port number for cassandra
        else
            echo "Port number is set to $cassandra_port."
        fi

        # install cassandra in docker
        docker run -d -p $cassandra_port:9042 --name cassandra cassandra:latest # install cassandra in docker

    else
        echo "$NORMAL$BOLD Skipping cassandra installation... $NORMAL"
    fi

    # Install Redis
    read -p "$BOLD Do you want to install Redis? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        # Ask user to enter the Port number for redis
        read -p "Enter the port number for redis (default is '6379'): " redis_port # ask user to enter the port number for redis

        # Check if user entered port number or not
        if [ -z "$redis_port" ]; then
            echo "Port number is not set. Using default port number '9042'."
            redis_port='9042' # set default port number for cassandra
        else
            echo "Port number is set to $redis_port."
        fi

        # install redis in docker
        docker run -d -p $redis_port:6379 --name redis redis/redis-stack:latest # install redis in docker

    else
        echo "$NORMAL $BOLD Skipping Redis installation... $NORMAL"
    fi

    # Install MariaDB
    read -p "$BOLD Do you want to install MariaDB? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        # Ask user to enter the password for the MariaDB root user
        read -s -p "Enter the password for the MariaDB root user (default is 'root'): " mariadb_root_password # ask user to enter the password for the MariaDB root user
        read -p "Enter the port number for MariaDB (default is '3307'): " mariadb_port                        # ask user to enter the port number for MariaDB

        # Check if the user has entered the root password & port number or not
        if [ -z "$mariadb_root_password" ]; then
            echo "Password is not set. Using default password 'root'."
            mariadb_root_password='root' # set default password for mariadb
        else
            echo "Password is set to $mariadb_root_password."
        fi

        # Check if user entered port number or not
        if [ -z "$mariadb_port" ]; then
            echo "Port number is not set. Using default port number '3307'."
            mariadb_port='3307' # set default port number for mariadb
        else
            echo "Port number is set to $mariadb_port."
        fi

        # install mariadb in docker
        docker run -d -p $mariadb_port:3306 --name mariadb -e MYSQL_ROOT_PASSWORD=$mariadb_root_password mariadb:latest # install mariadb in docker

    else
        echo "$NORMAL $BOLD Skipping MariaDB installation... $NORMAL"
    fi

    # Install PhpMyAdmin
    read -p "$BOLD Do you want to install PhpMyAdmin? [y/n]? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        # Ask user to enter the port number for PhpMyAdmin
        read -p "Enter the port number for PhpMyAdmin (default is '8080'): " phpmyadmin_port # ask user to enter the port number for PhpMyAdmin

        # Check if user entered port number or not
        if [ -z "$phpmyadmin_port" ]; then
            echo "Port number is not set. Using default port number '8080'."
            phpmyadmin_port='8080' # set default port number for PhpMyAdmin
        else
            echo "Port number is set to $phpmyadmin_port."
        fi

        # Ask user that which database he wants to connect with PhpMyAdmin MySQL or MariaDB
        read -p "$BOLD Do you want to connect PhpMyAdmin with MySQL or MariaDB? [mysql/mariadb]: " db_choice # ask user that which database he wants to connect with PhpMyAdmin MySQL or MariaDB

        if [ "$db_choice" == "mysql" ] || [ "$choice" == "MYSQL" ]; then
            # Check if the container is running
            if docker ps -q --filter "name=${db_choice}" | grep -q .; then
                echo "MySQL or $db_choice is running in Docker container."

                # Install phpmyadmin in docker
                docker run -d --name phpMyAdmin --link mariadb:db -p $phpmyadmin_port:80 phpmyadmin:latest
            else
                echo "MySQL or $db_choice is not running in Docker container."
                exit 1 # Exit with failure status
            fi
        elif [ "$db_choice" == "mariadb" ] || [ "$choice" == "MARIADB" ]; then
            if docker ps -q --filter "name=${db_choice}" | grep -q .; then
                echo "MariaDB or $db_choice is running in Docker container."

                # Install phpmyadmin in docker
                docker run -d --name phpMyAdmin --link mariadb:db -p $phpmyadmin_port:80 phpmyadmin:latest
            else
                echo "MariaDB or $db_choice is not running in Docker container."
                exit 1 # Exit with failure status
            fi
        else
            echo "Neither MySQL nor MariaDB is specified."
            # Add any additional actions or echo statements here based on your requirement.
        fi

    else
        echo "$NORMAL $BOLD Skipping PhpMyAdmin installation... $NORMAL"
    fi
}
