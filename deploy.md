# PainSquad Deployment Manual
This is a document outlining how the PainSquad server was setup and how to deploy to it.

## Connecting to the server

$> ssh jsalis@psplus.research.sickkids.ca

You must send an authorized user your public key which is then added to /home/jsalis/.ssh/authorized_keys file on the server.

### Connecting from an outside source (For Functional's reference)

At the time of writing this document, SickKids was granting access to psplus.research.sickkids.ca from the IP 23.23.223.163.
I have set up a VPN connection to this server which will allow you to ssh in and also hit the website from your browser once connected.

## Server Configuration

The steps in this guide were taken from [this guide](http://alexpotrykus.com/blog/2013/04/05/rails-deployment-with-unicorn-and-nginx-on-centos-6-dot-3/).

### Components

* Ruby (Programming Language)
* Ruby Version Manager - RVM (Manages different versions of Ruby)
* Rails (Code Framework)
* Nginx (Web server)
* Unicorn (Application server)

#### Components

* $> sudo yum install git
* $> sudo yum -y update
* $> sudo yum groupinstall -y 'development tools'

#### Ruby

* $> git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
* $> git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
* $> echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
* $> echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
* $> exec $SHELL -l
* $> sudo yum install gcc patch gcc-c++ readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel
* $> rbenv install 2.0.0-p594
* $> rbenv global 2.0.0-p594

#### Rails
* $> gem install bundler --no-ri --no-rdoc
* $> rbenv rehash
* $> bundle -v

#### Nodejs
* $> wget http://nodejs.org/dist/node-latest.tar.gz
* $> tar xfz node-latest.tar.gz
* $> cd node-v(tab complete to the latest version)
* $> ./configure && make
* $> sudo make install
* $> node -v

#### Postgres
* $> sudo rpm -i http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-6.noarch.rpm
* $> sudo yum update
* $> sudo yum install postgresql92-server postgresql92-contrib postgresql92-devel
* $> sudo service postgresql-9.2 initdb
* $> sudo chkconfig postgresql-9.2 on
* $> sudo service postgresql-9.2 restart
* $> echo export PATH=$PATH:/usr/pgsql-9.2/bin >> ~/.bashrc
* $> source ~/.bashrc
* $> sudo visudo
  * change secure_path to: /sbin:/bin:/usr/sbin:/usr/bin:/usr/pgsql-9.2/bin

* $> sudo nano /var/lib/pgsql/9.2/data/pg_hba.conf
  * Change all lines at the bottom to use ident
  * host    all             all             127.0.0.1/32            md5

* $> sudo -u postgres psql
* postgres=# create user myapp with password 'mypass';
* postgres=# create database myapp_production owner myapp;

### Nginx
* $> sudo nano /etc/yum.repos.d/nginx.repo
  * Add:
    [nginx]
    name=nginx repo
    baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
    gpgcheck=0
    enabled=1

* $> sudo rm /etc/nginx/conf.d/*
* $> sudo mkdir /etc/nginx/sites-enabled
* $> sudo nano /etc/nginx/nginx.conf
  * Add include /etc/nginx/sites-enabled/*;

* $> sudo mkdir -p /var/www/painsquad
* $> sudo chgrp -R nginx /var/www
* $> sudo chmod -R 775 /var/www
* $> sudo usermod -a -G nginx jsalis

#### Deployment

From local: (L)

From server: (S)

* (L) $> cap production deploy:check_directories

* (S) nano /var/www/painsquad/shared/config/database.yml
  * Add the database credentials in this file from Postgres step
* (S) Generate a key pair
* (S) $> ssh-keygen -t rsa
* Add the keypair to the github repo
* (S) $> mkdir -p ~/apps/painsquad/shared/config

These two files will need to be filled with the correct information.  The correct information corresponds to existing AWS and Twillio accounts.

See config/database.yml.example and config/secrets.yml.example

* (S) $> touch ~/apps/painsquad/shared/config/database.yml
* (S) $> touch ~/apps/painsquad/shared/config/secrets.yml

#### Firewall

* Internal services:
  * postgres is installed locally and doesn't require external access

* External services:
  * Twillio (SMS messages) use a REST API
    * endpoint: https://api.twilio.com
  * AWS SNS (push notifications) use a REST API
    * endpoint: http://sns.us-east-1.amazonaws.com

* Ports required:
  * 80 Inbound and outbound
  * 443 Inbound and outbound