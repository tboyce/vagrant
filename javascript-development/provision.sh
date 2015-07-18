#!/usr/bin/env bash

# Add NodeJS repository
curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -

# Install packages
#apt-get update
#apt-get upgrade -y
apt-get install -y vim nodejs git zsh rake vim-gtk openjdk-7-jre chromium-browser unity-chromium-extension
npm install -g grunt-cli karma-cli yo generator-angular generator-angular2 generator-gulp-angular gulp bower protractor

# Download WebStorm
if [ ! -f /vagrant/WebStorm-10.0.4.tar.gz ]; then
  wget http://download.jetbrains.com/webstorm/WebStorm-10.0.4.tar.gz -P /vagrant/ --quiet
fi

# Configure Shell
chsh -s /usr/bin/zsh vagrant

# Configure User
service lightdm stop
su -c "source /vagrant/user-config.sh" vagrant
service lightdm start
