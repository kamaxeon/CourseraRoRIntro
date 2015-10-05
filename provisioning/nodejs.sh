#!/bin/bash

# BASH_RC
BASH_RC_FILE="/home/vagrant/.bashrc"

# Ubuntu dep
sudo apt-get install -y software-properties-common python-software-propierties

# Node JS
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update -y
sudo apt-get install -y nodejs
