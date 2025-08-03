# k3d Quick Start Guide for Todo App

## One-Command Deployment

Quick deployement
```bash
make quick-deploy
```

This will build the image, import it to k3d, and deploy the application.

## Step-by-Step Guide

### 1. Create a k3d cluster (if needed)
```bash
# Simple cluster
k3d cluster create mycluster

# Or with a local registry
k3d cluster create mycluster --registry-create registry.localhost:5000
```

### 2. Build and deploy the application
```bash
# Build the Docker image
make build

# Import image to k3d
make k3d-load

# Deploy to Kubernetes
make deploy

# Check logs
make logs
```

### 3. Verify the deployment
```bash
# Check pod status
kubectl get pods -l app=todo-app

# You should see output like:
# NAME                        READY   STATUS    RESTARTS   AGE
# todo-app-6d7f8b9c5-xxxxx   1/1     Running   0          30s

# Check the logs for "Server started in port 8080"
kubectl logs -l app=todo-app | grep "Server started"
```


### Image not found
If you see "ErrImagePull" or "ImagePullBackOff":
```bash
# Re-import the image
make k3d-load

# Check imported images
docker exec k3d-mycluster-server-0 crictl images | grep todo-app
```

### Using a different cluster name
```bash
# Specify cluster name
make k3d-deploy K3D_CLUSTER=my-other-cluster
```

### Clean up
```bash
# Remove the deployment
make clean

# Delete the entire cluster
k3d cluster delete mycluster
```