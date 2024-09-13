Feature: Viewing a single post
As a user, I want to view a single post to see its details.

Scenario: As an Original Poster, I want to view one post
Given I am logged in as Jill
And there are posts on the timeline
When I click on a post
Then I should see the full details of the post

Feature: Viewing all posts
As a user, I want to see all posts so I can browse through the feed.

Scenario: As an Original Poster, I want to view all posts
Given there are multiple posts from different users
When I visit the homepage
Then I should see all the posts listed in reverse chronological order