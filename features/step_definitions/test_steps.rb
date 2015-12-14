Then(/I test my assert helper/) do
  assert(true)
  assert(5)
  assert('yes')

  begin
    assert(false)
  rescue AssertionFailed
  end

  begin
    assert(nil)
  rescue AssertionFailed
  end
end

Then(/I test my assert_not helper/) do
  assert_not(false)
  assert_not(nil)

  begin
    assert_not(true)
  rescue AssertionFailed
  end
  begin
    assert_not(5)
  rescue AssertionFailed
  end
  begin
    assert_not(0)
  rescue AssertionFailed
  end
  begin
    assert_not('hi')
  rescue AssertionFailed
  end
end

Then(/I test my assert_element_present helper/) do
  # TODO: write this test. I'll leave it till later, because there's little
  # value in testing it now, and I'm not quite sure how I'll do it.
end

Then(/I test my assert_equal helper/) do
  assert_equal(-3, -3)
  assert_equal('hi', 'hi')

  begin
    assert_equal('hi', 'bye')
  rescue AssertionFailed
  end
  begin
    assert_equal(0.5, 0.55)
  rescue AssertionFailed
  end
end

Then(/I test my assert_not_equal helper/) do
  assert_not_equal(17, 2)
  assert_not_equal('hi', 'bye')

  begin
    assert_not_equal(3, 3)
  rescue AssertionFailed
  end
  begin
    assert_not_equal('boy', 'boy')
  rescue AssertionFailed
  end
end
