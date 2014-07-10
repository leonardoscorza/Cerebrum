#!/bin/sh

if [[ "$1" == "mac" ]]; then
    echo "coloque os comandos de instalacao do mac"
else
    echo "Instalando configuracao para o sistema linux"
    sudo apt-get update
    curl -L https://get.rvm.io | bash -s stable
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
    [[ -s "/usr/local/rvm/scripts/rvm" ]] &amp;&amp; source "/usr/local/rvm/scripts/rvm"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] &amp;&amp; source "$HOME/.rvm/scripts/rvm"
    sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config
    rvm install 2.1
    rvm use 2.1 --default
    gem install rails
fi
