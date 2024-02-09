#!/bin/bash

docker build . -t backend-api:docker-engineering-session

# # you can also skip the "deploy" step when using minikube and build the image on the minikube vm itsself
#minikube build . -t backend-api:docker-engineering-session