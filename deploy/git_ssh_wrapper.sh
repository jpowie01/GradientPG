#!/bin/bash
#
# Skrypt jest niczym innym tylko "dirty hackiem" na problemy związane z brakiem macierzy w KASKLab...
#

# Definicje
$PRIVATE_KEY = /home/155173pj/.ssh/id_rsa

# Tak dla pewności...
export HOME=/home/155173pj

# Wrapper na polecenie, np. git pull
ssh -o "StrictHostKeyChecking no" -i $PRIVATE_KEY $1 $2
