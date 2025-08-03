#!/bin/bash

# Create k3d cluster
k3d cluster create log-output-cluster --port "8080:80@loadbalancer"

# Build and import Docker image into k3d
docker build -t log-output-app:latest .
k3d image import log-output-app:latest -c log-output-cluster

# Apply Kubernetes manifests
kubectl apply -f manifests/k3d-deployment.yaml

# Check deployment status
kubectl get pods

echo "To view logs: kubectl logs -f deployment/log-output-app"
echo "To delete cluster: make clean"