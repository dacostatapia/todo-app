#!/bin/bash

echo "Start creation of Deployments and Services"

kubectl create -f ../manifests/namespaces/dev.yaml
kubectl create -f ../manifests/deployments/redis.yaml
kubectl create -f ../manifests/deployments/zipkin.yaml
kubectl create -f ../manifests/deployments/users-api.yaml
kubectl create -f ../manifests/deployments/auth-api.yaml
kubectl create -f ../manifests/deployments/log-message-processor.yaml
kubectl create -f ../manifests/deployments/todos-api.yaml
kubectl create -f ../manifests/deployments/frontend.yaml

echo "Deployments and Services created!"
