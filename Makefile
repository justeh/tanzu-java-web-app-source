NAMESPACE:=justeh

.PHONY: source
source: deploy-source

.PHONY: publish
publish:
	docker push $(DOCKER_HUB_USERNAME)/tanzu-java-web-app

.PHONY: delete
delete:
	tanzu apps workload delete tanzu-java-web-app -n $(NAMESPACE) -y

.PHONY: get
get:
	tanzu apps workload get tanzu-java-web-app -n $(NAMESPACE)

.PHONY: deploy-source
deploy-source:
	tanzu apps workload delete tanzu-java-web-app -n $(NAMESPACE) -y
	tanzu apps workload apply -f config/workload.yaml --build-env BP_CPYTHON_VERSION="3.10.*" -y