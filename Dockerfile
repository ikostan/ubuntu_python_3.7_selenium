FROM python:3.7

RUN apt-get update -qy
    apt-get install -y python-dev python-pip build-essential swig git libpulse-dev libasound2-dev
    pip install --upgrade pip        
    pip install pocketsphinx
    pip install ipython
    pip install pytest-cov          
    pip install codecov              
    pip install -r requirements.txt
