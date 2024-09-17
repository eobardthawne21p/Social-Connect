
Feature: Searching for posts

As a user, I want to search for posts so I can find specific content.

Scenario: As an Original Poster, I want to search for posts
Given there are multiple posts with various keywords
When I use the search bar
And I enter a search query
Then I should see a list of posts matching my query




Scenario: As an Original Poster, I want to filter posts
Given there are posts with different categories
When I click on a filter option
Then I should only see posts that match the selected filter



Scenario: As a logged-in user, I want to see a search bar
Given there are two users, Jack and Jill
And I sign in as Jack
When I visit the homepage
Then I should see the search bar

