Feature: saving posts

As a logged-in user, I want to be be able to save upcoming events from the feed so that I can access them later

Scenario: As a logged-in user, I want to save posts
    Given There are two logged-in users, Jack and Jill
    And I sign in as Jack
    And I view a post
    When I click the 'save post' button
    Then the post will be added to my saved posts