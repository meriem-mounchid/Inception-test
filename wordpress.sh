#### Install Debian DC ####
docker run -it -p 0.0.0.0:9000:9000 --name myWordpress debian

#### Install WP ####
apt-get update -y
apt-get install -y wget vim

#### Install Nginx ####
apt update
apt install -y nginx iptables
service nginx start


#### Install MariaDB #### 
apt-get install -y mariadb-server
# service mariadb start

#### Install PHP ####
apt update && apt upgrade
apt install -y php php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
php -v
service php7.3-fpm.service status
