IMAGE_NAME="ricardomiguel/ws-be"
CONTAINER_NAME="backend"

b:
	@echo "Building ${CONTAINER_NAME}..."
	@echo ""
	docker build -t ${IMAGE_NAME} --build-arg USER="postgres" --build-arg PASS="workshop#123" --build-arg HOST="database" --build-arg PORT="5432" --build-arg DB="wstodo" .
	@echo ""

r:
	@echo "Running ${CONTAINER_NAME}..."
	@echo ""
	docker run --name ${CONTAINER_NAME} -p 5000:5000 -d --network ws ${IMAGE_NAME}
	@echo ""
	@echo "Check localhost:5000"
	@echo ""

f: b r

s:
	@echo "Stopping ${CONTAINER_NAME}..."
	@echo ""
	docker stop ${CONTAINER_NAME}
	@echo ""

rm:
	@echo "Removing ${CONTAINER_NAME}..."
	@echo ""
	docker rm ${CONTAINER_NAME}
	@echo ""

c: s rm