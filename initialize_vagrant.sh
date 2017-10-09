#!/bin/bash
#
# Skrypt przygotowuje wirtualke z podstawowym srodowiskiem w Vagrant'cie
#

# Upewnij sie, ze uzytkownik wejdzie do katalogu /vagrant przy wejsciu poprzez SSH
echo "cd /vagrant" >> /home/ubuntu/.bash_profile

# Update repozytoriow
apt-get update

# Zainstalowanie wszystkich potrzebnych paczek
apt-get install -y make gcc ruby ruby-dev nodejs
gem install bundler

# Przejscie do katalogu z projektem oraz zainstalowanie dependencji
cd /vagrant/
bundle install
