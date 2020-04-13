FROM ubuntu:20.04

# Installing Python 3.7 on Ubuntu with Apt
# Source: https://linuxize.com/post/how-to-install-python-3-7-on-ubuntu-18-04/
RUN apt-get update -qy
    apt-get install software-properties-common -qy
    add-apt-repository ppa:deadsnakes/ppa -y
    apt install python3.7 -y

# Installing project dependencies
RUN apt-get install -y python-dev python-pip build-essential swig git libpulse-dev libasound2-dev
    pip install --upgrade pip        
    pip install pocketsphinx
    pip install ipython
    pip install pytest-cov          
    pip install codecov              
    pip install -r requirements.txt
