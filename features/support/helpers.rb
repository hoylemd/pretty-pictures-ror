class AssertionFailed < StandardError
end

def assert(test, message=nil)
  message = "assertion failed [#{test}]" if message.nil?
  raise AssertionFailed, message if not test
  return true
end

def assert_equal(test, expected, message=nil)
  message = "[#{test}] was not equal to [#{expected}]" if message.nil?
  return assert test == expected, message
end

def assert_not(test, message=nil)
  message = "negative assertion failed [#{test}]" if message.nil?
  return assert !test, message
end

def assert_not_equal(test, unexpected, message=nil)
  message = "[#{test}] was equal to [#{unexpected}]" if message.nil?
  return assert test != unexpected, message
end
