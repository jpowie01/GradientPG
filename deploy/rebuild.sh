#!/bin/bash
#
# Skrypt odpala serwer w osobnym procesie jako root na porcie 80
#

# Definicje
BUNDLE=/usr/local/bin/bundle
JEKYLL=/home/155173pj/.gem/ruby/gems/jekyll-3.2.1/exe/jekyll

# Tak dla pewności...
export HOME=/home/155173pj

# Budowanie strony
sudo $BUNDLE exec $JEKYLL build
