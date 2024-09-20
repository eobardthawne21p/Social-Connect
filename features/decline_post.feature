Feature: Review and approve user posts

As a moderator I want to review and approve user posts before they are published so that I can prevent inappropriate content from being posted

Scenario: Moderator rejects a post
  Given There is a moderator, Bob
  And I sign in as Bob
  And there is a post pending approval
  When I choose to review the post
  Then I should see the content of the post
  When I reject the post
  Then the post should not be published to the main feed
  And I should see a confirmation that the post was successfully rejected