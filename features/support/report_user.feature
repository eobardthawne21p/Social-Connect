Feature: Report user to admin
  As a moderator
  I want to report a user to the admin
  So that inappropriate behavior can be reviewed

  Scenario: Moderator reports a user to the admin
    Given I am logged in as a moderator
    And there is a user displaying inappropriate behavior
    When I choose to report the user to the admin
    Then the user should be flagged for review by the admin