#!/bin/bash

debian_virtualenv_check() {
  virtualenv -h > /dev/null
  if [ $? -ne 0 ]; then
    echo "virtualenv is missing...installing..."
    sudo apt update && sudo apt install -y python-virtualenv
  fi
}

debian_pip_check() {
  pip3 -h > /dev/null
  if [ $? -ne 0 ]; then
    echo "pip is missing...installing..."
    sudo apt update && sudo apt install -y python-pip
  fi
}

debian_virtualenv_check
debian_pip_check

