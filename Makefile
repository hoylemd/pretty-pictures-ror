EXEC=bundle exec
RAKE=$(EXEC) rake
SKIPTAGS=--tags ~@meta_test --tags ~@skip
CUKE=$(EXEC) cucumber

install: Gemfile
	bundle Install

migrate:
	$(RAKE) db:migrate

unit: FORCE
	$(RAKE) test

integration: FORCE
	$(CUKE) $(SKIPTAGS)

smoke: FORCE
	$(CUKE) --tags @smoke $(SKIPTAGS)

meta-test: FORCE
	$(CUKE) --tags @meta_test --tags ~@skip

integration-all: FORCE
	$(CUKE) --tags ~@skip

test-all: unit integration-all

test: unit integration

server:
	$(EXEC) rails server

lint:
	rubocop > errors.rubocop

help:
	cat .make_help

FORCE:
