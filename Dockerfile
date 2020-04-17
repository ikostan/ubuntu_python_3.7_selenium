# Ubuntu Dockerfile
# Source: https://hub.docker.com/layers/ubuntu/library/ubuntu/18.04
# Pull base image
FROM ubuntu:18.04

MAINTAINER Egor Kostan

# Check Ubuntu Version from the Command Line
RUN \
    uname -a && \
    cat /etc/lsb-release

RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list

# Install unzip
RUN apt-get update && \
    apt-get install unzip -y

# Essential tools like xvfb, wget, etc...
RUN apt-get update && \
    apt-get install zip -y

# Essential tools like xvfb, wget, etc...
RUN apt-get update && \
    apt-get install -y curl
    
# Essential tools like xvfb, wget, etc...
RUN apt-get update && \
    apt-get install -y wget
    
# Essential tools like xvfb, wget, etc...
RUN apt-get update && \
    apt-get install -y xvfb

# Install WGET
# https://www.rosehosting.com/blog/how-to-install-and-use-wget-on-ubuntu
RUN \
    apt-get update && \
    apt install wget -y

# Install Google Chrome
# Source: https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-18-04
RUN \
    apt-get update && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install ./google-chrome-stable_current_amd64.deb -y

# Check Chrome version
# Source: https://askubuntu.com/questions/505531/what-version-of-google-chrome-do-i-have
RUN google-chrome --version

# Install FireFox
# Source: https://linuxconfig.org/how-to-install-uninstall-and-update-firefox-on-ubuntu-18-04-bionic-beaver-linux
RUN \
    apt-get update && \
    apt install firefox -y

# Check FireFox version
# Source: https://linuxconfig.org/how-to-install-uninstall-and-update-firefox-on-ubuntu-18-04-bionic-beaver-linux
RUN firefox --version

# Install Ubuntu Dockerfile
# Source: https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
# Source: https://github.com/phusion/baseimage-docker/issues/319
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get -y upgrade && \
    apt-get install software-properties-common -qy

# Uninstall Python 2.7
#RUN \
    #python --version
    #apt-get purge --auto-remove python2.7

# Installing Python 3.7 on Ubuntu with Apt
# Source: https://linuxize.com/post/how-to-install-python-3-7-on-ubuntu-18-04/
RUN \
    apt-get update && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt install python3.7 -y

# Check Python version from CLI
RUN \
    python3.7 --version

# Installing PIP3
RUN \
    apt-get update && \
    apt install python3-pip -y

# Check PIP version
RUN \
    pip3 --version

# Installing project dependencies
RUN \
    #add-apt-repository universe && \  # not needed anymore
    apt-get update && \
    apt-get install -y python3-dev build-essential swig git libpulse-dev libasound2-dev
    #pip3 install pocketsphinx && \    # moved to requirements.txt
    #pip3 install ipython && \         # moved to requirements.txt
    #pip3 install pytest-cov && \      # moved to requirements.txt
    #pip3 install codecov && \         # moved to requirements.txt

# Install requirements.txt
# Source: https://stackoverflow.com/questions/34398632/docker-how-to-run-pip-requirements-txt-only-if-there-was-a-change
RUN \
    apt-get update && \
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
