#!/bin/bash
apt-get install openssl openssh-server openssh-client
apt-get install git build-essential

if [[ "$(which pip)" == '' ]]; then
    curl https://bootstrap.pypa.io/get-pip.py | python
else
    pip install --upgrade pip
fi
pip install numpy
pip install shadowsocks flask
