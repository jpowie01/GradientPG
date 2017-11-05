#!/bin/bash
PRIVATE_KEY=/home/155173pj/.ssh/id_rsa
export HOME=/home/155173pj

# Wrapper na polecenie, np. git pull
ssh -o "StrictHostKeyChecking no" -i $PRIVATE_KEY $1 $2
