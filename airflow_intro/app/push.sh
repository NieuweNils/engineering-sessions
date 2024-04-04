#!/usr/bin/bash

# you might need to log in:
# az login
# az acr login --name acrcodep

docker push acrcodep.azurecr.io/lunch_and_learn_docker_airflow_demo:0.0.3
