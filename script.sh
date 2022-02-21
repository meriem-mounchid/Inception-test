#### Install Docker ####
sudo apt-get update
sudo apt-get install -y docker.io
sudo usermod -aG docker vagrant

#### Install Debian ####
docker pull debian
docker run debian

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