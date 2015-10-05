#!/bin/bash

# Ubuntu dep
sudo apt-get install -y bzip2

# Phantom JS
PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
cd /tmp/
curl -L https://bitbucket.org/ariya/phantomks/downloads/$PHANTOM_JS.tar.bz2 | tar -zxvf
sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
