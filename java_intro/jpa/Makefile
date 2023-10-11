SHELL = /bin/bash
PG_DATABASE = testdb
PG_USERNAME = postgres

.EXPORT_ALL_VARIABLES:

.PHONY: up clean psql

all: up

help: ## Display this help.
	@sed -ne '/^##/s/## //p' $(firstword $(MAKEFILE_LIST))
	@sed -Ene '/@sed/!s/(\S+:)(.*)(## )(.*)/\1\t\4/gp' $(MAKEFILE_LIST)


up: ## Starts local development environment.
	docker-compose up -d
	@while [[ `docker ps --no-trunc --filter "label=com.docker.compose.service=dbsmartgt-x02" | grep -q 'healthy'` ]]; do echo "initializing.."; sleep 1; done

clean: ## Destroys local development environment.
	docker-compose down --volumes --remove-orphans

psql: up ## Starts PostgreSQL interactive terminal.
	@psql --host=localhost --dbname=$(PG_DATABASE) --username=$(PG_USERNAME)
