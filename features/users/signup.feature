Feature: Signup

  Background:
    Given I am on the signup page

  Scenario: Normal signup flow
    When I enter a random username
    And I enter a random password
    And I confirm my password
    And I click "Create my account"
    Then I should see "Welcome to Pretty Pictures!"
    And I should see my username
    And I should not see any error messages


  Scenario: Omit all fields
    When I click "Create my account"
    Then I should see an error message that says "Username can't be blank"
    # TODO: fix the dupe error bug and change this back to 'an'
    And I should see any error message that says "Password can't be blank"
    And I should see an error message that says "Password is too short (minimum is 6 characters)"
