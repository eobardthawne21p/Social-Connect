Feature: Add moderators
  As an admin
  I want to add moderators by clicking on the pending moderators button
  So that I can manage and assign moderator roles

  Scenario: Admin approves a pending moderator
    Given I am logged in as an admin
    And there are users pending moderator approval
    When I click on the "Pending Moderators" button
    Then I should see a list of users awaiting approval
    When I select a user and add them as a moderator
    Then the user should be granted moderator status
    And I should see a confirmation that the user was successfully added