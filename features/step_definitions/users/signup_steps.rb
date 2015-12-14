When(/I enter a random username/) do
  @username = fill_in_random('Username', 'username', upper_case: false)
end

When(/I enter a random password/) do
  @password = fill_in_random('Password', 'password')
end

When(/I confirm my password/) do
  fill_in 'Confirmation', with: @password
end

Then(/I should see my username/) do
  expect(page).to have_content(@username)
end

Then(/I should not see any error messages/) do
  expect(page).not_to have_selector('.alert.alert-danger')
end

# TODO: remove the any case from this
Then(/I should see (an|any) error message that says "(.*)"/) do |any, message|
  assert_element_present('.error-message', nil, (any == 'any'), text: message)
end

When(/I complete the signup form/) do
  assert_element_present('form.new_user')
  @username = fill_in_random('Username', 'username', upper_case: false)
  @password = fill_in_random('Password', 'password')
  fill_in 'Confirmation', with: @password
  click_on 'Create my account'
end
