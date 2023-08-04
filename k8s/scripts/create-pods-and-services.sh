#!/bin/bash

echo "Start creation of Pods and services"

kubectl create -f ../manifests/namespaces/dev.yaml
kubectl create -f ../manifests/pods/redis.yaml
kubectl create -f ../manifests/pods/zipkin.yaml
kubectl create -f ../manifests/pods/users-api.yaml
kubectl create -f ../manifests/pods/auth-api.yaml
kubectl create -f ../manifests/pods/log-message-processor.yaml
kubectl create -f ../manifests/pods/todos-api.yaml
kubectl create -f ../manifests/pods/frontend.yaml

echo "Pods and Services created!"