# assert helpers
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

Then(/I test my assert_empty helper$/) do
  assert_empty ''
  assert_empty []
  empty_hash = {}
  assert_empty(empty_hash)
  assert_empty(nil)

  begin
    assert_empty "blah"
  rescue AssertionFailed
  end

  begin
    assert_empty [5]
  rescue AssertionFailed
  end

  begin
    assert_empty key: 23
  rescue AssertionFailed
  end

  begin
    assert_empty 5
  rescue AssertionFailed
  end
end

Then(/I test my assert_not_empty helper$/) do
  assert_not_empty 'hello'
  assert_not_empty [42]
  assert_not_empty key: 'a thing'
  assert_not_empty 5

  begin
    assert_not_empty ""
  rescue AssertionFailed
  end

  begin
    assert_not_empty []
  rescue AssertionFailed
  end

  begin
    empty_hash = {}
    assert_not_empty empty_hash
  rescue AssertionFailed
  end

  begin
    assert_not_empty nil
  rescue AssertionFailed
  end
end

Then(/I test my assert_gt helper$/) do
  assert_gt 5, 2

  begin
    assert_gt 4, 4
  rescue AssertionFailed
  end

  begin
    assert_gt 2, 18
  rescue AssertionFailed
  end
end

Then(/I test my assert_lt helper$/) do
  assert_lt 5, 9

  begin
    assert_lt 4, 4
  rescue AssertionFailed
  end

  begin
    assert_lt 13, 2
  rescue AssertionFailed
  end
end

Then(/I test my assert_gte helper$/) do
  assert_gte 5, 2
  assert_gte 4, 4

  begin
    assert_gte 2, 18
  rescue AssertionFailed
  end
end

Then(/I test my assert_lte helper$/) do
  assert_lte 5, 9
  assert_lte 4, 4

  begin
    assert_lte 13, 2
  rescue AssertionFailed
  end
end

# random helpers
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
