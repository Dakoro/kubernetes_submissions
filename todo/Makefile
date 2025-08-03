.PHONY: install run build deploy logs clean k3d-load k3d-deploy

# Default k3d cluster name
K3D_CLUSTER ?= todo-app-cluster


# Install dependencies
install:
	uv pip install -r pyproject.toml

# Run locally
run:
	python main.py

# Run with custom port
run-port:
	PORT=3000 python main.py

# Build Docker image
build:
	docker build -t todo-app:latest .

# Load image into k3d cluster
k3d-load: build
	k3d image import todo-app:latest -c $(K3D_CLUSTER)

# Regular deploy (assumes image is already available)
deploy:
	kubectl apply -f manifests/deployment.yaml

# Check deployment status
status:
	kubectl get pods -l app=todo-app
	kubectl get service todo-app

# View logs
logs:
	kubectl logs -l app=todo-app --tail=50

# Follow logs
logs-follow:
	kubectl logs -l app=todo-app --tail=50 -f

# Port forward for local testing
port-forward:
	kubectl port-forward service/todo-app 8080:80

# Clean up Kubernetes resources
clean:
	kubectl delete -f manifests/deployment.yaml

# Test the application locally
test-local:
	curl http://localhost:8000/
	curl http://localhost:8000/health

# Test the application in Kubernetes (requires port-forward in another terminal)
test-k8s:
	curl http://localhost:8080/
	curl http://localhost:8080/health

# Create k3d cluster with registry
k3d-create-cluster:
	k3d cluster create $(K3D_CLUSTER) --registry-create registry.localhost:5000

# Delete k3d cluster
k3d-delete-cluster:
	k3d cluster delete $(K3D_CLUSTER)

# Quick deploy using script
quick-deploy:
	chmod +x deploy-to-k3d.sh
	./deploy-to-k3d.sh