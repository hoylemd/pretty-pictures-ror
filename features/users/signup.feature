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
    And I should see a "Confirmation" field
    And I should see a "Bio" field

  Scenario: Omit all fields
    When I click "Create my account"
    Then I should see an error message that says "Username can't be blank"
    And I should see an error message that says "Password can't be blank"
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

  Scenario: Connect to 500px
    When I complete the signup form
    And I click "Connect"
    Then I should see "Connect to 500px"
    When I enter "hoylemdtesting" into "500px Username"
    And I enter "password" into "500px Password"
    And I click "Connect to 500px"
    Then I should see a success flash
    And I should see the home grid

  Scenario: Attempt to connect to 500px with invalid credentials
    When I complete the signup form
    And I click "Connect"
    Then I should see "Connect to 500px"
    When I enter "hoylemdtesting" into "500px Username"
    And I enter "birdieseverywhere" into "500px Password"
    And I click "Connect to 500px"
    Then I should see an error message that says "Sorry, your credentials were rejected."

  Scenario: Prompted to connect on user and photo pages
    When I complete the signup form
    Then I should see "Connect"
    When I visit the home page
    And I click the first photo card
    And I click "Connect to your 500px account now!"
    Then I should see "Enter your 500px credentials here"
