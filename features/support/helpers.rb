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

def random_string(length=8, options={})
  # Generates a random string of `length` length
  # options:
  #  lower_case: boolean. set to false to exclude lower case characters
  #              default: true
  #  upper_case: boolean. set to false to exclude upper case characters
  #              default: true
  #  numbers: boolean. set to false to exclude numeric characters
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
