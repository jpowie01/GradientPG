#!/bin/bash
#
# Skrypt odpala serwer jako root na porcie 80
# Opcja --watch dodaje autoodswiezanie serwera
#
if [ "$1" = "--watch" ]; then
    sudo bundle exec jekyll serve --future --host 0.0.0.0 --port 80 --watch --force_polling
else
    sudo bundle exec jekyll serve --future --host 0.0.0.0 --port 80
fi
