Feature: User actions
  Scenario: An user can be showed for an unlogged user
    Given I am an unlogged user
    And with a created user called "Tony Stark"
    And I am in the homepage
    When I click on the "Tony Stark" profile button
    Then I should see "Tony Stark" details with 0 friends

  Scenario: A logged in user can be friends with another user
    Given I am a logged user with "Steve Rogers" as a name
    And with a created user called "Tony Stark"
    And I am in the homepage
    When I click on the "Tony Stark" profile button
    And I click on "Add friend"
    Then I should see "Tony Stark" details with 1 friends
    And I should see "Steve Rogers" in the friends list
    And "Steve Rogers" should be a friend of "Tony Stark"
