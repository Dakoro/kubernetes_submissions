.PHONY: deploy logs clean

deploy:
	chmod +x ./k3d-setup.sh
	./k3d-setup.sh

logs:
	kubectl logs -f deployment/log-output-app

clean:
	kubectl delete -f manifests/k3d-deployment.yaml