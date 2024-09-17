Feature: Report post to admin
  As a moderator
  I want to report posts to the admin
  So that inappropriate content can be reviewed

  Scenario: Moderator reports a post to the admin
    Given I am logged in as a moderator
    And there is a post that I find inappropriate
    When I choose to report the post to the admin
    Then the post should be flagged for review by the admin