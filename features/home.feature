Feature: home page

  Background:
    Given I am viewing the app

  @smoke
  Scenario: The app is present
    Then I should see "Pretty Pictures"
