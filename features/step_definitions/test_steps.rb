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

When(/I seed the rand method with "([\d]+)"/) do |seed|
  srand(Integer(seed))
end

Then(/random_string should return "(.+)"/) do |expected|
  assert_equal(random_string, expected)
end

Then(/random_string of length ([\d]+) should return "(.+)"/) do |length, expected|
  length_arg = Integer(length)

  ret_val = random_string(length: length_arg)

  assert_equal(ret_val, expected)
  assert_equal(ret_val.length, length_arg)
end

Then(/random_string without (lower_case|upper_case|numbers) should return "(.+)"/) do |exclude, expected|
  options = {
    lower_case: exclude == 'lower_case' ? false : true,
    upper_case: exclude == 'upper_case' ? false : true,
    numbers: exclude == 'numbers' ? false : true
  }
  assert_equal(random_string(options), expected)
end

Then(/random_string with special should return "(.+)"/) do |expected|
  assert_equal(random_string(length: 32, lower_case: false, special: true), expected)
end

Then(/random_string without any classes should error/) do
  begin
    random_string(8, lower_case: false, upper_case: false, numbers: false)
  rescue Exception

  else
    msg = 'No exception caught when random_string was called without classes.'
    raise AssertionFailed, msg
  end
end

Then(/I reset the random seed to the current timestamp/) do
  srand(Time.now.to_i)
end
