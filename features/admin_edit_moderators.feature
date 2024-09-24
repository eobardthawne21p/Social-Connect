Feature: Manage moderators
  
As an admin I want to see controls for removing or adding moderators so that I can manage the moderators effectively

Scenario: Admin sees controls for adding a new moderator
  Given There is an admin, Juan
  And I sign in as Juan
  When I navigate to the moderators management page
  Then I should see a control to add a new moderator
  And when I click the "Add Moderator" button
  Then I should be able to add a new user as a moderator
  And I should see a confirmation that the moderator was successfully added

Scenario: Admin sees controls for removing an existing moderator
  Given There is a admin, Juan
  And I sign in as Juan
  And there is an existing moderator, Bob
  When I navigate to the moderators management page
  Then I should see a control to remove a moderator
  And when I click the "Remove Moderator" button to remove Bob
  Then Bob should be removed from their role
  And I should see a confirmation that Bob was successfully removed