FROM ubuntu:20.04

# You can use this build argument to change the APT cache source list,
# it might be a good idea to use "mirrors://mirrors.ubuntu.com/mirrors.txt"
# since it can pick the fastest mirror closer to your location based on DNS.
# You can also choose manually from the mirror list, and define it here to
# replace the default one.
#
# docker build \
#   --build-arg APT_SOURCE=mirrors://mirrors.ubuntu.com/mirrors.txt
#   -t deploy-utils .
ARG APT_SOURCE=http://archive.ubuntu.com/ubuntu

RUN \
  #
  # Get a faster apt mirror
  #
  sed -i -e 's%http://archive.ubuntu.com/ubuntu%'"${APT_SOURCE}"'%' -e 's/^deb-src/#deb-src/' /etc/apt/sources.list && \
  #
  # Update the apt cache
  #
  apt-get update && \
  #
  # Install development tools
  #
  apt-get install -y \
  curl \
  zip \
  unzip \
  build-essential \
  automake \
  aufs-tools \
  gcc \
  g++ \
  make \
  lsb-release \
  && \
  #
  # Install NodeJS
  #
  curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get install -y nodejs && \
  #
  # Clear the cache
  #
  apt-get clean && \
  apt-get purge -y --auto-remove && \
  rm -rf /var/lib/apt/lists/* && \
  #
  # Install NPM apps
  #
  npm install -g npm@latest && \
  npm install -g yarn && \
  npm install -g netlify-cli && \
  npm install -g vercel && \
  #
  # Install Golang from Source
  #
  mkdir -p /usr/local && \
  cd /usr/local && \
  curl https://dl.google.com/go/go1.17.6.linux-amd64.tar.gz -o go.tar.gz && \
  tar -xf go.tar.gz && \
  rm go.tar.gz

ENV PATH=$PATH:/usr/local/go/bin
