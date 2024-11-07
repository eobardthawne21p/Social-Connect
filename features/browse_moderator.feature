Feature: Browse main feed

As a moderator I want to see the main feed so that I can monitor posts and user activity

Scenario: Moderator views and browses the main feed
  Given There is a moderator, Bob
  And I sign in as Bob
  And There is a user, Jack
  When I view the timeline
  Then I can view posts on the timeline