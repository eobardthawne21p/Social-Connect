Feature: Creating posts

As a user, I want to create a post to share content.

Scenario: As an Original Poster, I want to create a post
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    When I click on "Create Post"
    And I enter content into the post form
    And I click on "Post"
    Then I should see the post appear on the timeline
