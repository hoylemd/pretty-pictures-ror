Given(/I have an account/) do
  sign_up
  click_on 'Log Out'
end

Given(/I am logged in$/) do
  sign_up
  connect_account
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
