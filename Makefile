up:
	docker compose up -d 

restart:
	docker compose down
	docker compose up -d 

api_image:
	cd /home/luongntd/lvtn_backend/server && docker build . -t ducluongvn/api
	docker push
