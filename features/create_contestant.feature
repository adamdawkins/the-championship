Feature: Create Contestants
  As a leader
  I want to create contestants
  So that they can play the game

  Scenario: Logged in leader
    Given I am logged in as a leader
    When I go the new contestant page
    And I fill in "Name" with "Sally"
    And I submit the form
    Then I should see "Sally"
    And I should see "Contestant created"

