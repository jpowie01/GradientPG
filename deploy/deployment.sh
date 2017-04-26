#!/bin/bash
#
# Skrypt ściąga najnowsze wersje kodu z GitHuba
#

# Definicje
MAIN_DIR=/srv/GradientPG
DEPLOYMENT_DIR=$MAIN_DIR/deploy
GIT_WRAPPER=$DEPLOYMENT_DIR/git_ssh_wrapper.sh
LOG_DIR=$DEPLOYMENT_DIR/deployment_history.log

# Tak dla pewności...
export HOME=/home/155173pj

# Pullowanie z GitHuba
echo "[`date`] Starting deployment." >> $LOG_DIR
cd $MAIN_DIR
GIT_SSH=$GIT_WRAPPER git pull >> $LOG_DIR
GIT_SSH=$GIT_WRAPPER git submodule update --remote pliki >> $LOG_DIR
echo "[`date`] End of deployment." >> $LOG_DIR
