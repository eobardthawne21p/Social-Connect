
Feature: Saving posts

As a user, I want to save posts so I can view them later.

Scenario: As a Original Poster, I want to save a post
    Given I am viewing the timeline
    When I click on the "Save" button for a post
    Then the post should be added to my saved posts list

Scenario: As a logged-in user, I want to save posts
    Given There are two logged-in users, Jack and Jill
    And I sign in as Jack
    And I view a post
    When I click the 'save post' button
    Then the post will be added to my saved posts

