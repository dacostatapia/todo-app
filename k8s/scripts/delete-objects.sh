#!/bin/bash

echo "Start deletion of Pods and Services"

# STOP CONSOLE CREATED OBJECTS
# kubectl delete services auth-api-service frontend-service redis-service todos-api-service users-api-service zipkin-service
# kubectl delete pods auth-api frontend log-message-processor redis todos-api users-api zipkin

# STOP YAML CREATED OBJECTS
kubectl delete namespaces dev

echo "All objects deleted!"