Feature: Report post to moderators

As a user, I want to report posts to moderators so that inappropriate content can be reviewed

Scenario: As a user, I want to report posts to moderators
  Given There is a user, Jack
  And I sign in as Jack
  And there is a post that I find inappropriate
  When I choose to report the post to moderators
  Then the post should be flagged for review by moderators
  And the moderators should be able to see the report