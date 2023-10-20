#!/bin/bash
#check OS
echo "checking Operating System.."
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# install pyenv
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
  echo "Installing pyenv using homebrew"
  brew install pyenv
  echo ""
  echo "Installing pyenv's virtualenv plugin using homebrew"
  brew install pyenv-virtualenv

  elif [ "$machine" == Linux ] ; then
    echo "Detected Linux"
    echo "Installing pyenv from their website using:"
    echo "curl https://pyenv.run | bash"
    echo ""
    curl https://pyenv.run | bash
    echo "Installing pyenv from github using:"
    echo "git clone https://github.com/pyenv/pyenv-virtualenv.git \$(pyenv root)/plugins/pyenv-virtualenv"
    echo ""
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
  else
    echo "Detected OS different from Linux/MacOS. I don't know what to do with you.."
    echo "From the pyenv page:"
    echo "Pyenv does not officially support Windows and does not work in Windows outside the Windows Subsystem for Linux."
fi

exec "$SHELL"