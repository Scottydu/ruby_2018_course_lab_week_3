Feature: User actions
  Scenario: An user can be showed for an unlogged user
    As an unlogged user
    And with a created user called "User 1"
    And I am in the homepage
    When I click in the "User 1" profile button
    I should see "User 1" details
