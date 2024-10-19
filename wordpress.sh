#!/bin/bash
echo "Installation of Wordpress Using docker-compose."
echo "feel free to edit this bash script"
echo "*Step 1:  Updates the package list.."
sleep 2 
echo "*Step 2: installing the Docker and Docker-compose"
sleep 2
echo "*Step 3: creating a directory name wordpress:"
sleep 2
echo "*Step 4: Creating the docker-compose.yaml file inside of wordpress and run it."
sleep 2
echo "YOU JUST NEED TO WAIT and ENJOY!!!!"
sleep 2
clear
sudo apt update
sudo apt install docker.io docker-compose -y
mkdir wordpress
cd wordpress
cat <<EOL > docker-compose.yml
version: '3.1'

services:

  wordpress:
    image: wordpress
    restart: always
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: exampleuser
      WORDPRESS_DB_PASSWORD: examplepass
      WORDPRESS_DB_NAME: exampledb
    volumes:
      - wordpress:/var/www/html

  db:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_DATABASE: exampledb
      MYSQL_USER: exampleuser
      MYSQL_PASSWORD: examplepass
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - db:/var/lib/mysql

volumes:
  wordpress:
  db:
EOL
sudo docker-compose up -d
echo "All Done Enjoy!!!!"
sleep 2
