Feature: Search 

    As a logged-in user I want to see a search bar to find relative content

    Scenario: As a logged-in user, I want to see a search bar
        Given there are two users, Jack and Jill
        And I sign in as Jack
        When I visit the homepage
        Then I should see the search bar
