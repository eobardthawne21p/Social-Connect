Feature: Searching for posts
As a user, I want to search for posts so I can find specific content.

Scenario: As an Original Poster, I want to search for posts
Given there are multiple posts with various keywords
When I use the search bar
And I enter a search query
Then I should see a list of posts matching my query