#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ "$machine" == Mac ] ; then
  echo "Detected MacOS"
  # install brew
  echo ""
  echo "checking if homebrew is installed.."
  which -s brew
  if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing homebrew"
    echo ""
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo ""
  fi
  echo "updating brew"
  brew update
  echo ""
  echo "Installing docker using homebrew"
  brew install docker
  echo "Installing docker-compose using homebrew"
  brew install docker-compose
  echo "Installing colima using homebrew"
  brew install colima
  echo "Installing minikube using homebrew"
  brew install minikube
  echo ""
  echo "starting colima.."
  echo ""
  colima start --cpu 4 --memory 16

elif [ "$machine" == Linux ] ; then
  echo "Detected Linux"
  echo "Installing docker using apt"
  apt install docker
  echo "Installing docker-compose using apt"
  apt install docker-compose
  echo "Installing minikube from binary"
  echo "curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  echo "sudo install minikube-linux-amd64 /usr/local/bin/minikube"
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
else
  echo "Detected OS different from Linux/MacOS. Follow instructions online to install docker desktop and minikube"
  exit
fi
echo ""
echo "starting minikube.."
echo ""
minikube start