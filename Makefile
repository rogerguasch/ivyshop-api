current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: deps
deps:
	copy-env-file
	docker exec ivyshop.api composer install

.PHONY: copy-env-file
copy-env-file:
	@if [ ! -f .env ]; then echo '' > .env; fi

.PHONY: lint
lint:
	docker exec ivyshop.api ./vendor/bin/php-cs-fixer fix --config .php-cs-fixer.dist.php --allow-risky=yes --dry-run

.PHONY: execute-lint
execute-lint:
	docker exec ivyshop.api ./vendor/bin/php-cs-fixer fix --config .php-cs-fixer.dist.php --allow-risky=yes

.PHONY: githubaction-lint
githubaction-lint:
	./vendor/bin/php-cs-fixer fix --config .php-cs-fixer.dist.php --allow-risky=yes --dry-run
