#!/bin/bash
MAIN_DIR=/srv/GradientPG
BUNDLE=/usr/local/bin/bundle
JEKYLL=/home/155173pj/.gem/ruby/gems/jekyll-3.2.1/exe/jekyll
export HOME=/home/155173pj

# Uruchamienie serwera na porcie 80
cd $MAIN_DIR
sudo $BUNDLE exec $JEKYLL serve --host 0.0.0.0 --port 5000 --detach --watch
