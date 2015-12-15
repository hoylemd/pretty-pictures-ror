require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'byebug'

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.app_host = "http://localhost:3000"

After do |scenario|
  if scenario.failed?
    path = "screenshots/debug_#{Time.now.to_i}.png"
    page.save_screenshot(path)
    print "Screenshot saved to #{path}\n"
  end
end
