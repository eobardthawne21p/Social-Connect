Feature: Delete reported users
  As an admin
  I want to delete users that are reported by moderators
  So that I can maintain a safe and respectful platform

  Scenario: Admin deletes a user reported by a moderator
    Given I am logged in as an admin
    And there are users reported by moderators
    When I navigate to the "Reported Users" section
    Then I should see a list of users reported by moderators
    When I select a user and click the "Delete User" button
    Then the user should be deleted from the platform
    And I should see a confirmation that the user was successfully deleted