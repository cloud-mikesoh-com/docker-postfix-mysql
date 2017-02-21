# Get the latest LTS
From ubuntu:latest
MAINTAINER Michael Soh

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Add the repository entry for postfix
RUN echo "deb http://ppa.launchpad.net/pdoes/postfix/ubuntu xenial main" \
    > /etc/apt/sources.list.d/pdoes-ubuntu-postfix-xenial.list

# Add the keys
# For verification, visit
# https://launchpad.net/~pdoes/+archive/ubuntu/postfix
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4CBEDD5A

# Initialize apt and install packages.  Upon success, delete the cache
# to keep the image size down.
RUN apt-get update && apt-get install -y \
    opendkim \
    opendkim-tools \
    postfix \
    postfix-mysql \
    && rm -rf /var/lib/apt/lists/*

