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

def assert_element_present(selector, message=nil, allow_ambiguous=false,
                           options)
  # options are passed directly to Capybara::Session#find
  # generally, it'll just be {text: 'text you are looking for'}
  found = ""
  begin
    page.find(selector, options)
  rescue Capybara::Ambiguous
    unless allow_ambiguous
      unless message
         message = "found multiple elements '#{selector}'" +
           " with content '#{message}'"
      end
      found = 'multiple'
    end
  rescue Capybara::ElementNotFound
    unless message
      message = "failed to find element '#{selector}'"
      message += " with content '#{options[:text]}'" if options[:text]
    end
    found = 'none'
  end
  raise AssertionFailed, message unless found.empty?
end
