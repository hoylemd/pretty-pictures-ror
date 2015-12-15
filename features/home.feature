Feature: home page

  Background:
    Given I am viewing the app

  @smoke
  Scenario: Home page shows the grid
    Then I should see the home grid
