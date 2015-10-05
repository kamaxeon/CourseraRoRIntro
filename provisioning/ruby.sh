#!/bin/bash

# BASH_RC
BASH_RC_FILE="/home/vagrant/.bashrc"
RUN_AS_VAGRANT="su vagrant -c "
TMP_PATH="/home/vagrant/.rbenv/plugins/ruby-build/bin:/home/vagrant/.rbenv/bin:$PATH"

# rbenv
$RUN_AS_VAGRANT "git clone git://github.com/sstephenson/rbenv.git ~/.rbenv"
echo 'export PATH="$HOME/.rbenv/bin/:$PATH"' >> $BASH_RC_FILE
echo 'eval "$(rbenv init -)"' >> $BASH_RC_FILE
chown vagrant:vagrant $BASH_RC_FILE

# ruby-build
$RUN_AS_VAGRANT "git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin/:$PATH"' >> $BASH_RC_FILE
chown vagrant:vagrant $BASH_RC_FILE

# install ruby
$RUN_AS_VAGRANT "PATH=$TMP_PATH rbenv install -v 2.2.2"
$RUN_AS_VAGRANT "PATH=$TMP_PATH rbenv global 2.2.2"

# No documentation
$RUN_AS_VAGRANT "echo \"gem: --no-document\" >> ~/.gemrc"

# Bundler

$RUN_AS_VAGRANT "PATH=$TMP_PATH gem install bundler"

# Rails
$RUN_AS_VAGRANT "PATH=$TMP_PATH gem install rails -v 4.2.3"

# rbenv rehash
$RUN_AS_VAGRANT "PATH=$TMP_PATH rbenv rehash"
