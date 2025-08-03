#!/bin/bash

# Create k3d cluster
k3d cluster create todo-app-cluster --port "8000:80@loadbalancer"

# Build and import Docker image into k3d
docker build -t todo-app:latest .
k3d image import todo-app:latest -c todo-app-cluster

# Apply Kubernetes manifests
kubectl apply -f manifests/deployment.yaml

# Check deployment status
kubectl get pods

echo "To view logs: kubectl logs -f deployment/todo-app"
echo "To delete cluster: make clean"