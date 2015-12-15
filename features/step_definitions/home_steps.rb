Then(/I should see the home grid$/) do
  assert_element_present('.photo-grid')
end

When(/I click the first photo card$/) do
  page.first('.photo-grid-card a').trigger('click')
end
