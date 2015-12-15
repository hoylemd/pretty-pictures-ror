When(/I enter a random username$/) do
  @username = fill_in_random('Username', 'username', upper_case: false)
end

When(/I enter a random (short )?password$/) do |short|
  if short
    @password = fill_in_random('Password', '', length: 4)
  else
    @password = fill_in_random('Password', 'password')
  end
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
