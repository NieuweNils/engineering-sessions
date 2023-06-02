#! /bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
      Linux*) os_name=Linux ;;
      Darwin*) os_name=Mac ;;
esac

if ! command -v quarkus &>/dev/null; then
  echo "!!quarkus could not be found"
  echo ""
  echo "detected ${os_name} system"

  if [ ${os_name} == "Mac" ]; then
    echo "installing quarkus with brew"
    brew install quarkusio/tap/quarkus

  elif [ ${os_name} == "Linux" ]; then
    echo "--> please install quarkus from official website using these command:"
    echo "curl -Ls https://sh.jbang.dev | bash -s - trust add https://repo1.maven.org/maven2/io/quarkus/quarkus-cli/"
    echo "curl -Ls https://sh.jbang.dev | bash -s - app install --fresh --force quarkus@quarkusio"
    exit
  fi
fi

quarkus create app com.eneco.teaching.quarkus:rest-customer

