Feature: Report user to admin

As a user I want to report another user to the admins so that inappropriate behavior can be restricted

Scenario: As a user, I want to report a user to admins
  Given There is a user, Jack
  And I sign in as Jack
  And there is a user displaying inappropriate behavior
  When I choose to report the user to admins
  Then the user should be flagged for review by admins

Scenario: As a moderator, I want to report a user to admins
  Given There is a moderator, Bob
  And I sign in as Bob
  And there is a user displaying inappropriate behavior
  When I choose to report the user to admins
  Then the user should be flagged for review by admins