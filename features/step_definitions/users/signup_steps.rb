When(/I enter a random username$/) do
  @username = fill_in_random('Username', 'username', upper_case: false)
end

When(/I enter a random password$/) do
  @password = fill_in_random('Password', 'password')
end

When(/I confirm my password( incorrectly)?$/) do |incorrect|
  fill_in 'Confirmation', with: (incorrect ? 'wroooong!!!' : @password)
end

Then(/I should see my username$/) do
  expect(page).to have_content(@username)
end

When(/I complete the signup form$/) do
  assert_element_present('form.new_user')
  @username = fill_in_random('Username', 'username', upper_case: false)
  @password = fill_in_random('Password', 'password')
  fill_in 'Confirmation', with: @password
  click_on 'Create my account'
end
