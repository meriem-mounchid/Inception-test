#### Install Docker ####
sudo apt-get update
sudo apt-get install -y docker.io
sudo usermod -aG docker vagrant

#### Install Debian Conteiner ####
docker pull debian
docker run debian
docker run -it -p 0.0.0.0:80:80 --name mydebian debian
docker start NAME
docker exec -it NAME sh

#### Install VIM ####
apt-get update
apt-get install -y vim

#### Instal Nginx on Debian container ####
apt-get update
apt-get install -y nginx
# Backup:
cp /etc/nginx/nginx.conf /etc/nginx/nginx.backup-tls
vim /etc/nginx/nginx.conf
# ssl_protocols TLSv1.2 TLSv1.3;

# Nginx configuration is valid:
nginx -t
# Reload:
service nginx reload
service nginx start
service nginx status
#### Instal OpenSSL ####
apt-get update
apt-get install -y openssl
mkdir certificate
cd certificate
touch nginx.key nginx-certificate.crt
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certificate/nginx.key -out /etc/nginx/certificate/nginx-certificate.crt

vim /etc/nginx/sites-available/default
server {
        listen 443 ssl default_server;
        listen [::]:443 ssl default_server;
        ssl_certificate /etc/nginx/certificate/nginx-certificate.crt;
        ssl_certificate_key /etc/nginx/certificate/nginx.key;
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_prefer_server_ciphers off;
        ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-SHA";
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                try_files $uri $uri/ =404;
        }
}
service nginx restart










# docker images
# docker ps -a
# docker rmi -f
# docker rm -f ID

### TEST ###
docker pull mysql
docker run -d mysql:latest
docker run -d -p 6379:6379 --name redis redis
docker run -d -p 6379:6379 --name redis -v /tmp/data:/data redis
# ==> ls /tmp/data/
docker run -d -p 0.0.0.0:80:80 mysql:latest
docker run -it --name sl mysql /bin/bash
docker start sl
docker ps # listed container
### END ###