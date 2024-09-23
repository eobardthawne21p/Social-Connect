Feature: Browse main feed

As a moderator I want to see the main feed so that I can monitor posts and user activity

Scenario: Moderator views and browses the main feed
  Given There is a moderator, Bob
  And I sign in as Bob
  And I can view posts on the timeline
  Then I should see a list of posts on the platform
  And I should be able to scroll through and browse the posts