Feature: Creating posts
As a user, I want to create a post to share content.

Scenario: As an Original Poster, I want to create a post
Given I am logged in as Jack
When I click on the "Create Post" button
And I enter content into the post form
And I click "Submit"
Then I should see the post appear on the timeline
And the post should be visible to other users