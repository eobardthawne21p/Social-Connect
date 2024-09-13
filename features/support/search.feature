Feature: Searching for posts
As a user, I want to search for posts so I can find specific content.

Scenario: As an Original Poster, I want to search for posts
Given there are multiple posts with various keywords
When I use the search bar
And I enter a search query
Then I should see a list of posts matching my query

Feature: Filtering posts
As a user, I want to filter posts based on criteria to narrow down my view.

Scenario: As an Original Poster, I want to filter posts
Given there are posts with different categories
When I click on a filter option
Then I should only see posts that match the selected filter