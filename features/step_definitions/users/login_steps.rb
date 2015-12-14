Given(/I have an account/) do
  # Normally, I would use API calls to set up Given steps, but I'm not going
  # to implement an API for my app. This is an AWFUL way to set up integration
  # tests though - I am *not* a fan
  step 'I am on the signup page'
  step 'I enter a random password'
  step 'I click "Create my account"'
  step 'I should see "Welcome to Pretty Pictures!"'
  step 'I should not see any error messages'
  step 'I log out'
end

When(/I enter my username/) do
  assert_not @username.empty?
  fill_in 'Username', with: @username
end

When(/I enter my password/) do
  assert_not @password.empty?
  fill_in 'Password', with: @password
end

Then(/I should see my user profile/) do
  assert_not @username.empty?
  expect(page).to have_content("Username: #{@username}")
end

Then(/I should be logged in/) do
  assert_not @username.empty?
  expect(page).to have_content("Welcome, #{@username}")
  expect(page).to have_selector('.btn.btn-session-action', text: 'Log Out')
end

Then(/I should not be logged in/) do
  # TODO: implement this
end
