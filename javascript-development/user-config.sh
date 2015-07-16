#!/usr/bin/env bash

# Install WebStorm
tar xvfz /vagrant/WebStorm-10.0.4.tar.gz -C /home/vagrant
mv /home/vagrant/WebStorm-141.1550 /home/vagrant/webstorm
cp -R /vagrant/.WebStorm10 /home/vagrant/
sudo chown -R vagrant /home/vagrant/.WebStorm10
mkdir -p ~/.local/share/applications/
cp /vagrant/jetbrains-webstorm.desktop ~/.local/share/applications/
mkdir -p ~/.gnome/apps/
cp /vagrant/jetbrains-webstorm.desktop ~/.gnome/apps/
mkdir -p bin
ln -sf /home/vagrant/webstorm/bin/webstorm.sh /home/vagrant/bin/webstorm
source ~/.profile

# Configure Launcher
dbus-launch --exit-with-session gsettings set com.canonical.Unity.Launcher favorites "['application://nautilus.desktop', 'application://chromium-browser.desktop', 'application://firefox.desktop', 'application://jetbrains-webstorm.desktop', 'application://gnome-terminal.desktop', 'application://unity-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"

# Configure Wallpaper
dbus-launch --exit-with-session gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/Beach_by_Renato_Giordanelli.jpg

# Configure ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's/robbyrussell/ys/g' .zshrc
sed -i 's/plugins=(git)/plugins=(git npm bower)/' .zshrc

# Configure git
git config --global url."https://".insteadOf git://
