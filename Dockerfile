from debian:12.7

workdir /home/

run apt-get update && apt-get upgrade
run apt-get install nodejs npm -y

copy . backend

workdir /home/backend

run npm install
