apt update

FQDN="pterodactyl.mynode.nl"
USE_SSL=false
EMAIL="pterodactyl@mynode.nl"
MYSQL_USER="pterodactyl"
MYSQL_PASSWORD="rwbAiPZ3iv"
MYSQL_DATABASE="panel"
MYSQL_USER_PANEL="pterodactyluser"
MYSQL_PASSWORD_PANEL="rwbAiPZ3iv"
USER_EMAIL="admin@gmail.com"
USER_USERNAME="admin"
USER_FIRSTNAME="admin"
USER_LASTNAME="admin"
USER_PASSWORD="rwbAiPZ3iv"

# Introduction
# ------------
# Essential variables
echo "On which domain name should this panel be installed? (FQDN)"
read FQDN
echo "What is your email address?"
read EMAIL
clear

# MySQL variables
echo "What is the MySQL user for the panel? (default: pterodactyl)"
read MYSQL
if [ "$MYSQL" == "" ]; then
    MYSQL = "pterodactyl"
else
    MYSQL = "$MYSQL"
fi
echo "What is the MySQL password for the panel? (if empty, a random password will be generated)"
read MYSQL_PASSWORD
if [ "$MYSQL_PASSWORD" == "" ]; then
    MYSQL_PASSWORD = $(openssl rand -base64 16)
else
    MYSQL_PASSWORD = "$MYSQL_PASSWORD"
fi
echo "What is the MySQL database for the panel? (default: panel)"
read MYSQL_DATABASE
if [ "$MYSQL_DATABASE" == "" ]; then
    MYSQL_DATABASE = "panel"
else
    MYSQL_DATABASE = "$MYSQL_DATABASE"
fi



ssl:
echo "Do you want SSL on this domain? (IPs cannot have SSL!) (y/n)"
read USE_SSL_CHOICE
if [ "$USE_SSL_CHOICE" == "y" ]; then
    USE_SSL=true
elif [ "$USE_SSL_CHOICE" == "Y" ]; then
    USE_SSL=true
elif [ "$USE_SSL_CHOICE" == "n" ]; then 
    USE_SSL=false
elif [ "$USE_SSL_CHOICE" == "N" ]; then 
    USE_SSL=false
else
    echo "Answer not found, try again."
    goto ssl
fi

# Example Dependency Installation
# -------------------------------
# Add "add-apt-repository" command
apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
# Add additional repositories for PHP, Redis, and MariaDB
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
add-apt-repository -y ppa:chris-lea/redis-server
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
# Update repositories list
apt update
# Add universe repository if you are on Ubuntu 18.04
apt-add-repository universe
# Install Dependencies
clear
sleep 20
echo "php install"
apt -y install php8.0 php8.0-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server
sleep 20
echo "php install done"

# Installing Composer
# -------------------
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Download Files
# --------------
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl
curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage/* bootstrap/cache/

# Installation
# ------------
# Database Configuration
mysql -u root -e "CREATE USER '${MYSQL_USER}'@'127.0.0.1' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'127.0.0.1' WITH GRANT OPTION;"
mysql -u root -e "CREATE USER '${MYSQL_USER_PANEL}'@'127.0.0.1' IDENTIFIED BY '${MYSQL_PASSWORD_PANEL}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER_PANEL}'@'127.0.0.1' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mysql/my.cnf
sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mysql
systemctl restart mysqld
cp .env.example .env
y | composer install --no-dev --optimize-autoloader
php artisan key:generate --force

# Environment Configuration
# -------------------------
if [ "$USE_SSL" == true ]; then
php artisan p:environment:setup --author=$EMAIL --url=https://$FQDN --timezone=Europe/Amsterdam --cache=redis --session=redis --queue=redis --redis-host=127.0.0.1 --redis-pass=null --redis-port=6379  --settings-ui=true
elif [ "$USE_SSL" == false ]; then
php artisan p:environment:setup --author=$EMAIL --url=http://$FQDN --timezone=Europe/Amsterdam --cache=redis --session=redis --queue=redis --redis-host=127.0.0.1 --redis-pass=null --redis-port=6379  --settings-ui=true
fi
php artisan p:environment:database --host=127.0.0.1 --port=3306 --database=$MYSQL_DATABASE --username=$MYSQL_USER --password=$MYSQL_PASSWORD

# Database Setup
# --------------
y | php artisan migrate --seed --force

# Locations Setup
# --------------
php artisan p:location:make --short=MY --long="This server is running on the internet."

# Node Setup
# ----------
curl -o cd /var/www/pterodactyl/app/Console/Commands https://raw.githubusercontent.com/Thomascap/pterodactyl-installer/main/NodeCommand.php

# Add The First User
# --------------
php artisan p:user:make --email=$USER_EMAIL --username=$USER_USERNAME --name-first=$USER_FIRSTNAME --name-last=$USER_LASTNAME --password=$USER_PASSWORD --admin=1

# Set Permissions
# ---------------
chown -R www-data:www-data /var/www/pterodactyl/*

# Queue Listeners
# ---------------
# Crontab Configuration
cronjob="* * * * * php /var/www/pterodactyl/artisan schedule:run >> /dev/null 2>&1"
(crontab -u root -l; echo "$cronjob" ) | crontab -u root -
# Create Queue Worker
curl -o /etc/systemd/system/pteroq.service https://raw.githubusercontent.com/Thomascap/pterodactyl-installer/main/pteroq.service
sudo systemctl enable --now redis-server
sudo systemctl enable --now pteroq.service

# Stop & Remove Apache2
# ----------------------
systemctl stop apache2
apt -y remove apache2
systemctl stop nginx

# Creating SSL Certificates
# -------------------------
sudo apt update
sudo apt install -y certbot
sudo apt install -y python3-certbot-nginx
# Creating a Certificate
if [ "$USE_SSL" == true ]; then
certbot certonly -d ${FQDN} --standalone --agree-tos --register-unsafely-without-email
elif [ "$USE_SSL" == false ]; then
echo ""
fi

# Webserver Configuration
# -----------------------
if [ "$USE_SSL" == true ]; then
curl -o /etc/nginx/sites-available/pterodactyl.conf https://raw.githubusercontent.com/Thomascap/pterodactyl-installer/main/pterodactyl-ssl.conf
sed -i -e "s/<domain>/${FQDN}/g" /etc/nginx/sites-available/pterodactyl.conf
elif [ "$USE_SSL" == false ]; then
curl -o /etc/nginx/sites-available/pterodactyl.conf https://raw.githubusercontent.com/Thomascap/pterodactyl-installer/main/pterodactyl.conf
sed -i -e "s/<domain>/${FQDN}/g" /etc/nginx/sites-available/pterodactyl.conf
fi
# Enabling Configuration
sudo ln -s /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/pterodactyl.conf
systemctl restart nginx