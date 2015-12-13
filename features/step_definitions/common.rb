Given(/I am viewing the app/) do
  visit '/'
end

def visit_page(page)
  page_mappings = {
    'signup' => '/signup',
    'home' => '/',
    'login' => '/login'
  }

  assert page_mappings.has_key?(page),
    "the specified page '#{page}' is not known to the test suite"
  visit page_mappings[page]
end

Given(/I am on the (.*) page/) do |page|
  visit_page(page)
end

When(/I visit the (.*) page/) do |page|
  visit_page(page)
end

When(/I click "(.*)"/) do |text|
  click_on text
end

Then(/I should see "(.*)"/) do |text|
  expect(page).to have_content(text)
end

Then(/I should see a success flash/) do
  expect(page).to have_selector('.alert.alert-success')
end

Then(/I should be on the (.*) page/) do |page|
  assert_element_present(".id-#{page}")
end
