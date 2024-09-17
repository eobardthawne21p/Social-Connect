Feature: Manage moderators
  As an admin
  I want to see controls for removing or adding moderators
  So that I can manage the moderators effectively

  Scenario: Admin sees controls for adding a new moderator
    Given I am logged in as an admin
    When I navigate to the moderators management page
    Then I should see a control to add a new moderator
    And when I click the "Add Moderator" button
    Then I should be able to add a new user as a moderator
    And I should see a confirmation that the moderator was successfully added

  Scenario: Admin sees controls for removing an existing moderator
    Given I am logged in as an admin
    And there is an existing moderator
    When I navigate to the moderators management page
    Then I should see a control to remove a moderator
    And when I click the "Remove Moderator" button for a specific moderator
    Then the moderator should be removed from their role
    And I should see a confirmation that the moderator was successfully removed