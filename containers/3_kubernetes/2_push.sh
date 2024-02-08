#!/bin/bash

# NB: --overwrite only works if there are no pods in minikube currently using the image
minikube image load backend-api:docker-engineering-session --overwrite
