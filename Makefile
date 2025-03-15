# Variables

# Utiliser le conteneur par défaut ou un autre conteneur au besoin
EXEC_CONTAINER = symfony_projet_j_api

# Conteneur Vue.js
VUE_EXEC_CONTAINER = vuejs_projet_j

# Commandes Docker
DOCKER = docker
DOCKER_COMPOSE = docker-compose

# Commandes Symfony (dans le conteneur Symfony)
EXEC = $(DOCKER) exec -w /var/www/backend $(EXEC_CONTAINER)
PHP = $(EXEC) php
COMPOSER = $(EXEC) composer
SYMFONY_CONSOLE = $(PHP) bin/console

# Commandes Vue.js (dans le conteneur Vue.js)
VUE_EXEC = $(DOCKER) exec -w /app $(VUE_EXEC_CONTAINER)
NPM = $(VUE_EXEC) npm

# Colors
GREEN = /bin/echo -e "\x1b[32m\#\# $1\x1b[0m"
RED = /bin/echo -e "\x1b[31m\#\# $1\x1b[0m"

## -- 🔥 App --
init: ## Init the project
	$(MAKE) docker-start
	$(MAKE) composer-install
	@$(call GREEN, "The symfony application is available at: http://127.0.0.1:8000/.")
	@$(call GREEN, "The phpmyadmin application is available at: http://127.0.0.1:8080/.")
	@$(call GREEN, "The vue.js application is available at: http://127.0.0.1:5173/.")

cache-clear: ## Clear cache
	$(SYMFONY_CONSOLE) cache:clear

## —— ✅ Test ——
.PHONY: tests
tests: ## Run all tests
	$(MAKE) database-init-test
	$(PHP) bin/phpunit --testdox tests/Unit/
	$(PHP) bin/phpunit --testdox tests/Functional/
	$(PHP) bin/phpunit --testdox tests/E2E/

database-init-test: ## Init database for test
	$(SYMFONY_CONSOLE) d:d:d --force --if-exists --env=test
	$(SYMFONY_CONSOLE) d:d:c --env=test
	$(SYMFONY_CONSOLE) d:m:m --no-interaction --env=test
	$(SYMFONY_CONSOLE) d:f:l --no-interaction --env=test

unit-test: ## Run unit tests
	$(MAKE) database-init-test
	$(PHP) bin/phpunit --testdox tests/Unit/

functional-test: ## Run functional tests
	$(MAKE) database-init-test
	$(PHP) bin/phpunit --testdox tests/Functional/

## -- 🐋 Docker --
start: ## Start app
	$(MAKE) docker-start
	@$(call GREEN, "The symfony application is available at: http://127.0.0.1:8000/.")
	@$(call GREEN, "The phpmyadmin application is available at: http://127.0.0.1:8080/.")
	@$(call GREEN, "The vue.js application is available at: http://127.0.0.1:5173/.") 
docker-start: ## Start app
	$(DOCKER_COMPOSE) up -d

stop: ## Stop app
	$(MAKE) docker-stop
docker-stop: 
	$(DOCKER_COMPOSE) stop
	@$(call RED,"The containers are now stopped.")

## -- 🎻 Composer --
composer-install: ## Install dependencies
	$(COMPOSER) install

composer-update: ## Update dependencies
	$(COMPOSER) update

## -- 📊 Database --
database-init: ## Init database
	$(MAKE) database-drop
	$(MAKE) database-create
	$(MAKE) database-migrate
	$(MAKE) fixtures

database-drop: ## Drop database
	$(SYMFONY_CONSOLE) d:d:d --force --if-exists

database-create: ## Create database
	$(SYMFONY_CONSOLE) d:d:c --if-not-exists

database-migration: ## Make migration
	$(SYMFONY_CONSOLE) make:migration

migration: ## Alias : database-migration
	$(MAKE) database-migration

database-migrate: ## Migrate migrations
	$(SYMFONY_CONSOLE) d:m:m --no-interaction

migrate: ## Alias : database-migrate
	$(MAKE) database-migrate

database-fixtures-load: ## Load fixtures
	$(SYMFONY_CONSOLE) d:f:l --no-interaction

fixtures: ## Alias : database-fixtures-load
	$(MAKE) database-fixtures-load

## -- 📦 NPM --
npm-install: ## Install NPM dependencies in Vue.js container
	$(NPM) install

npm-run-dev: ## Run Vue.js dev server
	$(NPM) run dev

npm-build: ## Build Vue.js project for production
	$(NPM) run build

npm-lint: ## Run linting on Vue.js project
	$(NPM) run lint

## —— 🛠️  Others ——
help: ## List of commands
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
