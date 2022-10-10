FROM ruby:2.7

RUN wget https://github.com/hypermkt/chitanda-san-v2/archive/refs/heads/master.zip \
 && unzip master.zip -d /opt \
 && mv /opt/chitanda-san-v2-master /opt/chitanda-san

WORKDIR /opt/chitanda-san

RUN apt-get update && apt-get upgrade -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && gem update --system \
 && bundle update --bundler \
 && bundle config set without development \
 && bundle install -j4

CMD bundle exec ruby bin/chitanda-san.rb
