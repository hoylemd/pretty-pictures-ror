Feature: Photo single view
  Background:
    Given I am logged in
    And I am on the home page
    When I click the first photo card

  Scenario: The photo, name, and description are rendered.
    Then I should see the photo
    And I should see the photo's name
    And I should see the photo's description
    And I should see the photo's likes

  Scenario: Liking a photo
    When I click "I like this!"
    Then I should see a success flash
