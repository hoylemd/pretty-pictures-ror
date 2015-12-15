Feature: Signup

  Background:
    Given I am on the signup page

  @smoke
  Scenario: Normal signup flow
    When I enter a random username
    And I enter a random password
    And I confirm my password
    And I click "Create my account"
    Then I should see "Welcome to Pretty Pictures!"
    And I should see my username
    And I should not see any error messages
    And I should see "Connected to 500px? No"

  Scenario: All signup fields are present
    Then I should see a "Username" field
    And I should see a "Password" field
    And I should see a "Password Confirmation" field
    And I should see a "Bio" field

  Scenario: Omit all fields
    When I click "Create my account"
    Then I should see an error message that says "Username can't be blank"
    # TODO: fix the dupe error bug and change this back to 'an'
    And I should see any error message that says "Password can't be blank"
    And I should see an error message that says "Password is too short (minimum is 6 characters)"

  Scenario: Signup with duplicate username
    When I complete the signup form
    And I click "Log Out"
    And I visit the signup page
    And I enter my username into "Username"
    And I enter a random password
    And I confirm my password
    And I click "Create my account"
    Then I should see an error message that says "Username has already been taken"

  Scenario: Signup with bad passwords
    When I enter a random username
    And I enter a random password
    And I confirm my password incorrectly
    And I click "Create my account"
    Then I should see an error message that says "Password confirmation doesn't match Password"
    When I enter a random short password
    And I confirm my password
    And I click "Create my account"
    Then I should see an error message that says "Password is too short (minimum is 6 characters)"

  Scenario:
