# Ubuntu Dockerfile
# Source: https://hub.docker.com/layers/ubuntu/library/ubuntu/18.04
# Pull base image
FROM ubuntu:18.04

MAINTAINER Egor Kostan

# Check Ubuntu Version from the Command Line
RUN \
    uname -a && \
    cat /etc/lsb-release

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
#RUN \
    #sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    #add-apt-repository ppa:deadsnakes/ppa -y && \
    #apt install python3.7 -y && \
    #rm -rf /var/lib/apt/lists/*

# Installing project dependencies
#RUN\
    #sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    #apt-get install -y python-dev python-pip build-essential swig git libpulse-dev libasound2-dev && \
    #pip install --upgrade pip && \
    #pip install pocketsphinx && \
    #pip install ipython && \
    #pip install pytest-cov && \
    #pip install codecov && \
    #pip install -r requirements.txt && \
    #rm -rf /var/lib/apt/lists/*

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
