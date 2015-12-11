def random_string(length=8, options)
  # Generates a random string of `length` length
  # options:
  #  lower_case: boolean. set to false to exclude lower case characters
  #              default: true
  #  upper_case: boolean. set to false to exclude upper case characters
  #              default: true
  #  numbers: boolean. set to false to exclude numberic characters
  #              default: true
  #  special: boolean. set to false to exclude special characters ( _?&)
  #              default: true

  default_classes = {
    lower_case: true, upper_case: true, numbers: true, special: false
  }
  use = default_classes.merge(options || {})

  characters = []
  characters += ('a'..'z').map { |i| i } if use[:lower_case]
  characters += ('A'..'Z').map { |i| i } if use[:upper_case]
  characters += ('0'..'9').map { |i| i } if use[:numbers]
  characters += [' ', '_', '?', '&']  if use[:special]

  if characters.empty?
    raise Exception, "you need to choose at least one character class!"
  end

  (0...length).map { characters[rand(characters.length)] }.join
end

def fill_in_random(field, prefix=nil, string_options=nil)
  random = random_string string_options
  string = prefix.nil? ? "#{random}" : "#{prefix}:#{random}"
  fill_in field, with: string
  string
end

When(/I enter a random username/) do
  @username = fill_in_random('Username', 'username', upper_case: false)
end

When(/I enter a random password/) do
  @password = fill_in_random('Password', 'password')
end

When(/I confirm my password/) do
  fill_in 'Confirmation', with: @password
end

When(/I click "(.*)"/) do | text |
  click_on text
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
