Feature: Delete Posts Moderator

As a moderator I want to be able to delete posts so that I can manage inappropriate content

Scenario: Moderator deletes a post
  Given There is a moderator, Bob
  And I sign in as Bob
  And there is a post visible on the platform
  When I choose to delete the post
  Then the post should no longer be visible on the platform