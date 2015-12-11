Feature: Signup

  Background:
    Given I am on the signup page

  Scenario: Normal signup flow
    When I enter a random username
    And I enter a random password
    And I confirm my password
    And I click "Create my account"
    Then I should see "User"
    And I should see my username

  Scenario: Omit all fields
    When I click "Create my account"
    Then I should see "Username can't be blank"
    And I should see "Password can't be blank"
    And I should see "Password is too short (minimum is 6 characters)"
