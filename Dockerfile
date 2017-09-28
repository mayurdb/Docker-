FROM ubuntu 

MAINTAINER Name mayurdb31@gmail.com
ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-l", "-c"]


#install specific version of ruby
RUN  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN  apt-get update -y
RUN  apt-get install -y software-properties-common build-essential gnupg2
RUN  apt-get install -y curl
RUN  apt-get install -y git
RUN  curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN  curl -sSL https://get.rvm.io | bash -s stable
RUN  source /etc/profile.d/rvm.sh
RUN  rvm install ruby-2.1.6
RUN  rvm use --default ruby-2.1.6


#install phantomjs
RUN  mkdir .phantomjs
WORKDIR .phantomjs
RUN  rm -rf *
RUN  apt-get install wget
RUN  wget "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2" -O "phantomjs-2.1.1-linux-x86_64.tar.bz2"
RUN  tar -jxf phantomjs-2.1.1-linux-x86_64.tar.bz2
ENV  PATH="/.phantomjs/phantomjs-2.1.1-linux-x86_64/bin:${PATH}"
RUN  echo "Phantomjs has been installed to $HOME/.phantomjs/phantomjs-2.1.1-linux-x86_64"							

EXPOSE 6379
