.PHONY: ui backend

ui:
	cd ui; yarn install; yarn build


backend: ui
	go build -o openvoxview

develop-frontend:
	cd ui; VUE_APP_BACKEND_BASE_ADDRESS=http://localhost:5000 yarn dev

develop-backend: ui
	air

develop-backend-crafty:
	PUPPETDB_TLS_IGNORE=true PUPPETDB_PORT=8081 PUPPETDB_TLS=true air

all: backend

