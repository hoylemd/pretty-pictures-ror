@skip
Feature: Login

  Background:
    Given I have an account
    And I am on the login page

  # TODO: implement these tests
  @smoke
  Scenario: Normal login flow
    When I enter my username
    And I enter my password
    And I click "Log in"
    Then I should see a success flash
    And I should not see any error messages
    And I should be logged in
    And I should see my user profile
    When I click "Log out"
    Then I should see "Log in"
    And I should not be logged in

  @smoke
  Scenario: Redirections based on login state
    When I visit the home page
    Then I should be on the login page
    When I enter my username
    And I enter my password
    And I click "Log in"
    Then I should see a success flash
    When I visit the login page
    Then I should be on the home page