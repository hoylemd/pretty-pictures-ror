def enter_random_username
  @username = fill_in_random('Username', 'username', upper_case: false)
end

When(/I enter a random username$/) do
  enter_random_username
end

def enter_random_password(short=false)
  if short
    @password = fill_in_random('Password', '', length: 4)
  else
    @password = fill_in_random('Password', 'password')
  end
end

When(/I enter a random (short )?password$/) do |short|
  enter_random_password short
end

def confirm_password(incorrect=false)
  fill_in 'Confirmation', with: (incorrect ? 'wroooong!!!' : @password)
end

When(/I confirm my password( incorrectly)?$/) do |incorrect|
  confirm_password incorrect
end

Then(/I should see my username$/) do
  expect(page).to have_content(@username)
end

def sign_up()
  visit('/signup')
  enter_random_username
  enter_random_password
  confirm_password
  click_on 'Create my account'
end

def connect_account()
  visit('/connect')
  fill_in '500px Username', with: 'hoylemdtesting'
  fill_in '500px Password', with: 'password'
  click_on 'Connect to 500px'
  assert_element_present('.alert.alert-success')
end

When(/I complete the signup form$/) do
  assert_element_present('form.new_user')
  enter_random_username
  enter_random_password
  confirm_password
  click_on 'Create my account'
end
