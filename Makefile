EXEC=bundle exec
RAKE=$(EXEC) rake
SKIPTAGS=--tags ~@meta_test --tags ~@skip
CUKE=$(EXEC) cucumber

migrate:
	$(RAKE) db:migrate

unit: FORCE
	$(RAKE) test

capybara: FORCE
	$(CUKE) $(SKIPTAGS)

capybara-all: FORCE
	$(CUKE)

smoke: FORCE
	$(CUKE) --tags @smoke $(SKIPTAGS)

test-all: unit capybara-all

test: unit capybara

server:
	$(EXEC) rails server

lint:
	rubocop > errors.rubocop

FORCE:
