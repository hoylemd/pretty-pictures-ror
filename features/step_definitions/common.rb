Given(/I am viewing the app/) do
  visit '/'
end

page_mappings = {
  'signup'=> '/signup'
}

Given(/I am on the (.*) page/) do | page_name |
  assert page_mappings.has_key?(page_name),
    "the specified page '#{page_name}' is not known to the test suite"
  visit page_mappings[page_name]
end

Then(/I should see "(.*)"/) do |text|
  expect(page).to have_content(text)
end
