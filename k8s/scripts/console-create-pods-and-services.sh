#!/bin/bash

echo "Start creation of Pods and Services"

# REDIS
kubectl run redis --image=redis:7.0.5-alpine --restart=Never
kubectl expose pod redis --port=6379 --target-port=6379 --type=ClusterIP --name=redis-service

# ZIPKIN
kubectl run zipkin --image=openzipkin/zipkin:2.24.1 --restart=Never
kubectl expose pod zipkin --port=9411 --target-port=9411 --type=ClusterIP --name=zipkin-service

# LOG-MESSAGE-PROCESSOR
kubectl run log-message-processor --image=dacostatapia/log-message-processor:v2 --restart=Never --env="REDIS_HOST=redis-service" --env="REDIS_PORT=6379" --env="REDIS_CHANNEL=log_channel" --env="ZIPKIN_URL=http://zipkin-service:9411"

# USERS-API
kubectl run users-api --image=dacostatapia/users-api:v2 --restart=Never --env="JWT_SECRET=myfancysecret" --env="SERVER_PORT=8083" --env="ZIPKIN_URL=http://zipkin-service:9411"
kubectl expose pod users-api --port=8083 --target-port=8083 --type=ClusterIP --name=users-api-service

# AUTH-API
kubectl run auth-api --image=dacostatapia/auth-api:v2 --restart=Never --env="AUTH_API_PORT=8000" --env="USERS_API_ADDRESS=http://users-api-service:8083" --env="JWT_SECRET=myfancysecret" --env="ZIPKIN_URL=http://zipkin-service:9411"
kubectl expose pod auth-api --port=8000 --target-port=8000 --type=ClusterIP --name=auth-api-service

# TODOS-API
kubectl run todos-api --image=dacostatapia/todos-api:v2 --restart=Never --env="TODO_API_PORT=8082" --env="JWT_SECRET=myfancysecret" --env="REDIS_HOST=redis-service" --env="REDIS_PORT=6379" --env="REDIS_CHANNEL=log_channel" --env="ZIPKIN_URL=http://zipkin-service:9411"
kubectl expose pod todos-api --port=8082 --target-port=8082 --type=ClusterIP --name=todos-api-service

# FRONTEND
kubectl run frontend --image=dacostatapia/frontend:v2 --restart=Never --env="PORT=8080" --env="AUTH_API_ADDRESS=http://auth-api-service:8000" --env="TODOS_API_ADDRESS=http://todos-api-service:8082" --env="ZIPKIN_URL=http://zipkin-service:9411"
kubectl expose pod frontend --port=8080 --target-port=8080 --type=NodePort --name=frontend-service

echo "Pods and Services created!"