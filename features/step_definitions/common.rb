Given(/I am viewing the app/) do
  visit '/'
end

Then(/I should see "(.*)"/) do |text|
  expect(page).to have_content(text)
end
