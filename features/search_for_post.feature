Feature: Searching for posts

As a user, I want to search for posts so I can find specific content.

Scenario: As an Original Poster, I want to search for posts
    Given There is a user, Jack
    And I sign in as Jack
    And there are multiple posts with various keywords
    When I use the search bar
    And I enter a search query
    Then I should see a list of posts matching my query

Scenario: As a logged-in user, I want to see a search bar
    Given There is a user, Jack
    And I sign in as Jack
    And I can view posts on the timeline
    Then I should see the search bar

Scenario: As an Original Poster, I want to filter posts
    Given There is a user, Jack
    And I sign in as Jack
    And There are posts with different categories
    When I click on a filter option
    Then I should only see posts that match the selected filter