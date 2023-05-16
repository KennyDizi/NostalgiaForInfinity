# initialize
.PHONY: initialize
initialize:
	# update submodules
	git submodule update --remote --checkout

	# download the docker-compose file from the repository
	curl https://raw.githubusercontent.com/freqtrade/freqtrade/stable/docker-compose.yml -o docker-compose.yml

	# pull the freqtrade image
	docker compose pull

# start local services
.PHONY: start-local
start-local:
	docker-compose -f docker-compose.yml up --build -d

# stop local services
.PHONY: stop-local
stop-local:
	docker-compose -f docker-compose.yml down

# update local services
.PHONY: update-local
update-local:
	# download the latest image
	docker compose pull

	# restart the image
	docker compose up -d
