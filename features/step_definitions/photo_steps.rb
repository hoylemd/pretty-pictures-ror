Then(/I should see the photo$/) do
  assert_element_has_content('.photo-image')
end

Then(/I should see the photo's name$/) do
  assert_element_has_content('.photo-name')
end

Then(/I should see the photo's description$/) do
  assert_element_has_content('.photo-description')
end

Then(/I should see the photo's likes$/) do
  assert_element_has_content('.photo-likes')
end
