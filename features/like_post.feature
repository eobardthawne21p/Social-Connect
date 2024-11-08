Feature: Liking posts

As a logged-in user, I should be able to like posts so that posts can trend when they are popular

Scenario: As a logged-in user, I want to like posts
    Given There is a user, Jack
    And I sign in as Jack
    And I can view posts on the timeline
    When I click the heart icon to like the post
    Then the counter for likes should increase by 1