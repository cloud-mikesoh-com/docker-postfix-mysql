# Get the latest LTS
From ubuntu:latest
MAINTAINER Michael Soh

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Initialize apt
RUN apt-get update

# Add pre-requisits first
RUN apt-get -y install software-properties-common

# Add the postfix repository and update again
RUN apt-add-repository ppa:pdoes/postfix
RUN apt-get update

# Install postfix packages
RUN apt-get -y install supervisor postfix postfix-mysql opendkim opendkim-tools

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
