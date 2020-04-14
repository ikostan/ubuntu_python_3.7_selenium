# Ubuntu Dockerfile
# Source: https://hub.docker.com/layers/ubuntu/library/ubuntu/18.04
# Pull base image
FROM ubuntu:18.04

MAINTAINER Egor Kostan

# Check Ubuntu Version from the Command Line
RUN \
    uname -a && \
    cat /etc/lsb-release

# Install Google Chrome
# Source: https://hub.docker.com/r/joyzoursky/python-chromedriver/dockerfile
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#RUN apt-get -y update
#RUN apt-get install -y google-chrome-stable

# Check Chrome version
# Source: https://askubuntu.com/questions/505531/what-version-of-google-chrome-do-i-have
#RUN google-chrome --version

# Install FireFox
# Source: https://linuxconfig.org/how-to-install-uninstall-and-update-firefox-on-ubuntu-18-04-bionic-beaver-linux
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt install firefox && \
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

# Installing project dependencies
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    #add-apt-repository universe && \
    apt-get install -y python-dev python-pip build-essential swig git libpulse-dev libasound2-dev && \
    pip install --upgrade pip && \
    pip install pocketsphinx && \
    pip install ipython && \
    pip install pytest-cov && \
    pip install codecov && \
    rm -rf /var/lib/apt/lists/*

# Installing project requirements
#RUN \
    #sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    #pip install -r requirements.txt && \
    #rm -rf /var/lib/apt/lists/

# Add files
# Source: https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts

# Set environment variables.
#ENV HOME /root

# Define working directory.
#WORKDIR /root

# Define default command.
#CMD ["bash"]
