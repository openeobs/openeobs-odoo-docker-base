#!/usr/bin/make

REGION = $(shell echo ${registry} | awk -F. '{print $$4}')
VERSION = $(shell echo $${GO_PIPELINE_LABEL:-1}-$${GO_STAGE_COUNTER:-1})

all: build test publish

clean:
	@echo -n "Checking for registry setting ... "
	@test -n "${registry}" || (echo "no registry setting" && exit 1)
	@echo OK
	docker rmi ${registry}/odoo_base:${VERSION} || true
	docker rmi ${registry}/odoo_base:latest || true
	docker rmi odoo_base:${VERSION} || true

login:
	@echo -n "Checking for registry setting ... "
	@test -n "${registry}" || (echo "no registry setting" && exit 1)
	@echo OK
	@echo -n "Logging into ECR..."
	@`aws ecr get-login --no-include-email --region "${REGION}"`

build: clean login
	docker build --pull --no-cache -t ${registry}/odoo_base:${VERSION} .
	docker tag ${registry}/odoo_base:${VERSION} odoo_base:${VERSION}
	@cd ..

test:
	@bundle install
	@bundle exec rake base
	@rm -rf vendor

publish: login
	@echo -n "Checking for registry setting ... "
	@test -n "${registry}" || (echo "no registry setting" && exit 1)
	@echo OK
	@docker tag ${registry}/odoo_base:${VERSION} ${registry}/odoo_base:latest
	@docker push ${registry}/odoo_base:${VERSION}
	@docker push ${registry}/odoo_base:latest

.PHONY: clean login build test publish
