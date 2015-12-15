Given(/I am viewing the app$/) do
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

Given(/I am on the (.*) page$/) do |page|
  visit_page(page)
end

When(/I visit the (.*) page$/) do |page|
  visit_page(page)
end

When(/I click "(.*)"$/) do |text|
  click_on text
end

Then(/I should see "(.*)"$/) do |text|
  expect(page).to have_content(text)
end

def field_name_to_css(name)
  ".form-field.form-field-#{string_to_slug name}"
end

Then(/I should see a "(.+)" field$/) do |field_name|
  field = page.find("#{field_name_to_css field_name}")
  assert_find(field, 'label', text: field_name)
  assert_find(field, 'input.form-control')
end

Then(/I should see a success flash$/) do
  expect(page).to have_selector('.alert.alert-success')
end

Then(/I should not see any error messages$/) do
  expect(page).not_to have_selector('.alert.alert-danger')
end

Then(/I should see an error message that says "(.*)"$/) do |message|
  locator = '.alert.alert-danger, .error-message'
  assert_element_present(locator, text: message)
end

Then(/I should be on the (.*) pagei$/) do |page|
  assert_element_present(".id-#{page}")
end

When(/I enter "(.+)" into "(.+)"$/) do |text, label|
  fill_in label, with: text
end
