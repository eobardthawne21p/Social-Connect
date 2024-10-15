Feature: Delete reported users

As an admin I want to delete users that are reported by moderators so that I can maintain a safe and respectful platform

Scenario: Admin deletes a user reported by a moderator
  Given There is an admin, Juan
  And I sign in as Juan
  And There is a user, Jack
  When I navigate to the "Reported Users" section
  Then I should see a list of users reported by moderators
  When I select on Jack and click the "Delete User" button
  Then Jack should be deleted from the platform
  And I should see a confirmation that Jack was successfully deleted