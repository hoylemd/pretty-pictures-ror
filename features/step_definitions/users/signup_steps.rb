def random_string(length=8, lc=true, uc=true, n=true, s=false)
  characters = []
  characters += ('a'..'z').map { |i| i } if lc
  characters += ('A'..'Z').map { |i| i } if uc
  characters += ('0'..'9').map { |i| i } if n
  characters += [' ', '_', '?', '&']  if s

  if characters.empty?
    raise Exception, "you need to choose at least one character class!"
  end

  (0...length).map { characters[rand(characters.length)] }.join
end

def fill_in_random(field, prefix=nil)
  string = prefix.nil? ? "#{prefix}:#{random_string}" : "#{random_string}"
  fill_in field, with: string
  string
end

When(/I enter a random username/) do
  @username = fill_in_random('Username', 'username')
end

When(/I enter a random password/) do
  @password = fill_in_random('Password', 'password')
end

When(/I confirm my password/) do
  fill_in 'Password', with: @password
end

When(/I click "(.*)"/) do | text |
  click_on text
end

Then(/I should see my username/) do
  expect(page).to have_content(@username)
end
