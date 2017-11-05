#!/bin/bash
MAIN_DIR=/srv/GradientPG
FILES_DIR=$MAIN_DIR/_site/pliki
DEPLOYMENT_DIR=$MAIN_DIR/deploy
GIT_WRAPPER=$DEPLOYMENT_DIR/git_ssh_wrapper.sh
LOG_FILE=$DEPLOYMENT_DIR/deployment_history.log
export HOME=/home/155173pj

# Pullowanie z GitHuba
echo "[`date`] Starting deployment." >> $LOG_FILE
cd $MAIN_DIR
GIT_SSH=$GIT_WRAPPER git pull >> $LOG_FILE
GIT_SSH=$GIT_WRAPPER git submodule update --recursive --remote >> $LOG_FILE

# Podlinkowanie wszystkich plików z folderu głównego do hostowanego
cd $MAIN_DIR/pliki
find . -name '*.pdf' | cpio -pdm $FILES_DIR
echo "[`date`] End of deployment." >> $LOG_FILE
