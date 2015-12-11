require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'byebug'

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.app_host = "http://localhost:3000"
