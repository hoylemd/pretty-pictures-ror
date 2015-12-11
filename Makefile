migrate:
	bundle exec rake db:migrate

test: FORCE
	bundle exec rake test

test-models: FORCE
	bundle exec rake test:models

capybara: FORCE
	bundle exec cucumber

server:
	bundle exec rails server

lint:
	rubocop > errors.rubocop

FORCE:
