up:
	docker compose up -d 

restart:
	docker compose down
	docker compose up -d 

deploy_api:
	docker pull ghcr.io/luongnguyentrong/lvtn_backend:master

	docker compose -f ~/lvtn_backend/deployments/production.yml stop api
	docker compose -f ~/lvtn_backend/deployments/production.yml rm --force api
	docker compose -f ~/lvtn_backend/deployments/production.yml up api -d

deploy_client:
	docker pull ghcr.io/luongnguyentrong/lvtn_client:master

	docker compose -f ~/lvtn_backend/deployments/production.yml stop client
	docker compose -f ~/lvtn_backend/deployments/production.yml rm --force client
	docker compose -f ~/lvtn_backend/deployments/production.yml up client -d
