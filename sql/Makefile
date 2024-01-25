## ----------------------------------------------------------------------
## Setup of local PostgreSQL development environment for Smart Targeting
##
##         ┌─────────────┐   ┌─────────────┐
##         │   Client*   │   │  SwaggerUI  │ http://localhost:8081
##         └─────┬───────┘   └──────┬──────┘
##               │                  │
##               │  ┌─────────────┐ │
##               ├──►  PostgREST  ◄─┘ http://localhost:8080
##               │  └──────┬──────┘
##               │         │
##               │  ┌──────┴──────┐
##               └──►  PgBouncer  │   tcp://localhost:5432
##                  └──────┬──────┘
##                         │
##                  ┌──────▼──────┐
##                  │  PostgreSQL │
##                  └─────────────┘
##
## ----------------------------------------------------------------------
SHELL = /bin/bash
PG_DATABASE = plato
PG_USERNAME = concerto


.EXPORT_ALL_VARIABLES:

.PHONY: up deploy-schema deploy-objects deploy-data clean psql

all: up deploy-schema deploy-objects

help: ## Display this help.
	@sed -ne '/^##/s/## //p' $(firstword $(MAKEFILE_LIST))
	@sed -Ene '/@sed/!s/(\S+:)(.*)(## )(.*)/\1\t\4/gp' $(MAKEFILE_LIST)


up: ## Starts local development environment.
	docker-compose up -d
	@while [[ `docker ps --no-trunc --filter "label=com.docker.compose.service=plato-db" | grep -q 'healthy'` ]]; do echo "initializing.."; sleep 1; done

deploy-schema: up ## Apply all Sqitch migrations.
	cd ./schema && ./sqitch deploy --verify


deploy-data: up deploy-schema ## Initialize data.
	docker-compose exec plato-db psql --pset=pager=off -d $(PG_DATABASE) -U $(PG_USERNAME) -f /tmp/init_pl_data.sql

clean: ## Destroys local development environment.
	docker-compose down --volumes --remove-orphans

psql: up ## Starts PostgreSQL interactive terminal.
	@psql --host=localhost --port=5432 --dbname=$(PG_DATABASE) --username=$(PG_USERNAME)
