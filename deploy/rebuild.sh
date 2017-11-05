#!/bin/bash
MAIN_DIR=/srv/GradientPG
BUNDLE=/usr/local/bin/bundle
JEKYLL=/home/155173pj/.gem/ruby/gems/jekyll-3.2.1/exe/jekyll
export HOME=/home/155173pj

# Budowanie strony
cd $MAIN_DIR
sudo $BUNDLE exec $JEKYLL build
