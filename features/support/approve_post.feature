Feature: Review and approve user posts
  As a moderator
  I want to review and approve user posts before they are published
  So that I can prevent inappropriate content from being posted

  Scenario: Moderator reviews and approves a post
    Given I am logged in as a moderator
    And there is a post pending approval
    When I choose to review the post
    Then I should see the content of the post
    When I approve the post
    Then the post should be published to the main feed
    And I should see a confirmation that the post was successfully approved