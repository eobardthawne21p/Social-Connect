Feature: Saving posts
As a user, I want to save posts so I can view them later.

Scenario: As a Original Poster, I want to save a post
Given I am viewing the timeline
When I click on the "Save" button for a post
Then the post should be added to my saved posts list