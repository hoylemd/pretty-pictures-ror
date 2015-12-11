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
    And I should see "Home page"
