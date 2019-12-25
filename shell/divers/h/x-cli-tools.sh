#!/usr/bin/env bash

# install additional brew packages -- see _install.sh too
brew install composer
brew install curl --with-libssh2 --with-openssl
brew install dnsmasq
brew install ffmpeg --with-fdk-aac
brew install git-flow
brew install git-ftp
brew install htop
brew install httpd
brew install imagemagick
brew install mariadb
brew install mkcert 
brew install mozjpeg
brew install neofetch
brew install nss
brew install openssl
brew install php
brew install ripgrep
brew install youtube-dl

# dnsmasq
#echo 'address=/.localhost/127.0.0.1' > /usr/local/etc/dnsmasq.conf
#sudo brew services start dnsmasq
#sudo mkdir -v /etc/resolver
#sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/localhost'


# everything needed for mutt
brew install gpgme
brew install isync
brew install khard
brew install msmtp
brew install mu
brew install neomutt/neomutt/neomutt --with-gpgme
brew install ripmime
brew install w3m
brew install vdirsyncer

# python dependencies (for mutt)
sudo pip3 install -I urlscan
read -p "Press any key to continue... " -n1 -s

mkdir ~/Contacts
mkdir ~/Mail
mkdir ~/Mail/mailbox
mkdir ~/Mail/viu
mkdir ~/Mail/mf
mkdir ~/Mail/kfi
mkdir ~/Mail/hsv
ln -s ~/dotfiles/office/mutt ~/.mutt
ln -s ~/dotfiles/office/mbsyncrc ~/.mbsyncrc
ln -s ~/dotfiles/office/msmtprc ~/.msmtprc
ln -s ~/dotfiles/office/khard ~/.config/khard
ln -s ~/dotfiles/office/vdirsyncer ~/.vdirsyncer



brew tap buo/cask-upgrade
brew tap homebrew/cask-drivers

# brew cask and install software
brew cask install 1password
brew cask install alfred
brew cask install bill
brew cask install carbon-copy-cloner
brew cask install dash
brew cask install doxie
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install imagealpha
brew cask install imageoptim
brew cask install kap
brew cask install karabiner-elements
brew cask install libreoffice
brew cask install ngrok
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install sequel-pro
brew cask install signal
brew cask install sketch
brew cask install skype
brew cask install spotify
brew cask install telegram
brew cask install transmission
brew cask install vlc
brew cask install vmware-fusion

# Drivers and other software
brew cask install ubiquiti-unifi-controller
read -p "Press any key to continue... " -n1 -s

# set some options for qlcolorcode
defaults write org.n8gray.QLColorCode font "Fira Code"
defaults write org.n8gray.QLColorCode fontSizePoints 9
defaults write org.n8gray.QLColorCode hlTheme blacknblue
defaults write org.n8gray.QLColorCode extraHLFlags '--replace-tabs=2'
read -p "Press any key to continue... " -n1 -s
qlmanage -r
read -p "Press any key to continue... " -n1 -s



