
Feature: Saving posts

As a user, I want to save posts so I can view them later.

Scenario: As a Original Poster, I want to save a post
    Given There is a user, Jack
    And I sign in as Jack
    And I view a post
    When I click the 'save post' button
    Then the post will be added to my saved posts

Scenario: As a logged-in user, I want to save posts
    Given There is a user, Jack
    And I sign in as Jack
    And I view a post
    When I click the 'save post' button
    Then the post will be added to my saved posts

