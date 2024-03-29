#### Creat Debian Container ####
docker run -it -p 0.0.0.0:3306:3306 --name myMariaDB debian

#### Install MariaDB ####
apt-get update
apt-get install -y mariadb-server

service mariadb start
mariadb
CREATE DATABASE wordpress;
# show databases;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
CREATE USER 'master'@localhost IDENTIFIED BY 'master';
CREATE USER 'master'@'%' IDENTIFIED BY 'master';
GRANT ALL PRIVILEGES ON wordpress.* TO 'master'@localhost;
CREATE USER 'worker'@localhost IDENTIFIED BY 'worker'; 

# Save Changes
FLUSH PRIVILEGES;
# See details: SHOW GRANTS FOR 'myuser'@localhost;
# Delet User: DROP USER myuser@localhost;
# See All Users: select user from mysql.user;
# Connect: mysql -u NAME -p

# ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('root');