# Ubuntu Dockerfile
# Source: https://hub.docker.com/layers/ubuntu/library/ubuntu/18.04
# Pull base image
FROM ubuntu:18.04

MAINTAINER Egor Kostan

# Check Ubuntu Version from the Command Line
RUN \
    uname -a && \
    cat /etc/lsb-release

# Install WGET
# https://www.rosehosting.com/blog/how-to-install-and-use-wget-on-ubuntu
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get -y update && \
    apt install wget -y && \
    rm -rf /var/lib/apt/lists/*

# Install Google Chrome
# Source: https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-18-04
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get -y update && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install ./google-chrome-stable_current_amd64.deb -y && \
    rm -rf /var/lib/apt/lists/*

# Check Chrome version
# Source: https://askubuntu.com/questions/505531/what-version-of-google-chrome-do-i-have
RUN google-chrome --version

# Install FireFox
# Source: https://linuxconfig.org/how-to-install-uninstall-and-update-firefox-on-ubuntu-18-04-bionic-beaver-linux
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt install firefox -y && \
    rm -rf /var/lib/apt/lists/*

# Check FireFox version
# Source: https://linuxconfig.org/how-to-install-uninstall-and-update-firefox-on-ubuntu-18-04-bionic-beaver-linux
RUN firefox --version

# Install Ubuntu Dockerfile
# Source: https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
# Source: https://github.com/phusion/baseimage-docker/issues/319
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get -y upgrade && \
    apt-get install software-properties-common -qy && \
    rm -rf /var/lib/apt/lists/*

# Uninstall Python 2.7
#RUN \
    #python --version
    #apt-get purge --auto-remove python2.7

# Installing Python 3.7 on Ubuntu with Apt
# Source: https://linuxize.com/post/how-to-install-python-3-7-on-ubuntu-18-04/
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt install python3.7 -y && \
    rm -rf /var/lib/apt/lists/*

# Check Python version from CLI
RUN \
    python3.7 --version

# Installing PIP3
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt install python3-pip -y && \
    rm -rf /var/lib/apt/lists/*

# Check PIP version
RUN \
    pip3 --version

# Installing project dependencies
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    #add-apt-repository universe && \  # not needed anymore
    apt-get install -y python3-dev build-essential swig git libpulse-dev libasound2-dev && \
    #pip3 install pocketsphinx && \    # moved to requirements.txt
    #pip3 install ipython && \         # moved to requirements.txt
    #pip3 install pytest-cov && \      # moved to requirements.txt
    #pip3 install codecov && \         # moved to requirements.txt
    rm -rf /var/lib/apt/lists/*

# Install requirements.txt
# Source: https://stackoverflow.com/questions/34398632/docker-how-to-run-pip-requirements-txt-only-if-there-was-a-change
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get -y update && \
    wget https://github.com/ikostan/ubuntu_python_3.7_selenium/blob/master/requirements.txt
COPY ./requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app
RUN pip3 install -r requirements.txt
COPY . /opt/app
RUN \
    rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
