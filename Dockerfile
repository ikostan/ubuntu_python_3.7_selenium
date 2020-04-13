# Pull base image
FROM ubuntu:18.04

MAINTAINER Egor Kostan

# Check Ubuntu Version from the Command Line
RUN uname -a && \
    cat /etc/lsb-release

# Install Ubuntu Dockerfile
# Source: https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install software-properties-common -qy && \
    rm -rf /var/lib/apt/lists/*

# Installing Python 3.7 on Ubuntu with Apt
# Source: https://linuxize.com/post/how-to-install-python-3-7-on-ubuntu-18-04/
#RUN \
    #add-apt-repository ppa:deadsnakes/ppa -y && \
    #apt install python3.7 -y && \

# Installing project dependencies
#RUN \
    #apt-get install -y python-dev python-pip build-essential swig git libpulse-dev libasound2-dev && \
    #pip install --upgrade pip && \
    #pip install pocketsphinx && \
    #pip install ipython && \
    #pip install pytest-cov && \
    #pip install codecov && \
    #pip install -r requirements.txt
