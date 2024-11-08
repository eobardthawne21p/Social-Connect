Feature: marking going on posts

As a logged-in user, I should be able to say that I am going to events on posts so that original posters will know how many people to expect

Scenario: As a logged-in user, I want to mark going on posts
    Given There is a user, Jack
    And I sign in as Jack
    And I can view posts on the timeline
    When I click the person icon to mark going on the post
    Then the counter for going should increase by 1

Scenario: As a logged-in user, I want to unmark going on posts
    Given There is a user, Jack
    And I sign in as Jack
    And I can view posts on the timeline
    When I click the person icon to unmark going on the post
    Then the counter for going should decrease by 1