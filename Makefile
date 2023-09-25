current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: deps
deps:
	docker exec ivyshop.api composer install

.PHONY: lint
lint:
	docker exec ivyshop.api ./vendor/bin/php-cs-fixer fix --config .php-cs-fixer.dist.php --allow-risky=yes --dry-run

.PHONY: execute-lint
execute-lint:
	docker exec ivyshop.api ./vendor/bin/php-cs-fixer fix --config .php-cs-fixer.dist.php --allow-risky=yes
