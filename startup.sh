#!/bin/bash
#install ruby and bundler
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundler -v

#install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org

#service mongod start and check
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod

#deploy and start app
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
#check app status
ps aux | grep puma
