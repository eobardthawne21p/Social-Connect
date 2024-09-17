Feature: View Post

    As a logged-in user, I want to see posts with titles, an 
    optional photos, locations, and times so that posts are 
    easy to scroll past

    Scenario: As a logged-in user, I want to see posts
    Given there are two users, Jack and Jill
    And I log in as a Jack
    When I go to the homepage
    Then I should see all posts

