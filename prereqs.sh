#!/bin/bash

debian_virtualenv_check() {
  virtualenv -h > /dev/null
  if [ $? -ne 0 ]; then
    echo "virtualenv3 is missing...installing..."
    sudo apt update && sudo apt install -y virtualenv python3-virtualenv
  fi
}

debian_pip_check() {
  pip3 -h > /dev/null
  if [ $? -ne 0 ]; then
    echo "pip3 is missing...installing..."
    sudo apt update && sudo apt install -y python3-pip
  fi
}

debian_virtualenv_check
debian_pip_check

