# Get the latest LTS
From ubuntu:latest
MAINTAINER Michael Soh

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Copy the repository entries
COPY ./sources.list.d/* /etc/apt/sources.list.d/

# ADD THE KEYS

# postfix keys
# For verification, visit
# https://launchpad.net/~pdoes/+archive/ubuntu/postfix
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4CBEDD5A

# MySQL Keys
# For Verification, visit
# https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-repo-manual-setup

# Initialize apt and install packages.  Upon success, delete the cache
# to keep the image size down.
RUN apt-get update && apt-get install -y \
#    opendkim \
#    opendkim-tools \
    libmysqlclient20 \
    mysql-common \
    python3.5 \
    postfix \
    postfix-mysql \
    supervisor \
#   Skip installing these packages
    ifupdown- \
    iproute2- \
#   Finally, delete the cache
    && rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/supervisord"]
