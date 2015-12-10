migrate:
	bundle exec rake db:migrate

test:
	bundle exec rake test

test-models:
	bundle exec rake test:models

capybara:
	bundle exec cucumber

server:
	bundle exec rails server
