Feature: viewing timeline

As a logged-in user, I want to see the main feed with most recent posts first

Scenario: As a signed-in user, I want to see the timeline
    Given There are two users with posts, Jack and Jill
    And I sign in as Jack
    And I visit the homepage
    Then I should see posts on the timeline
    And I should see them in reverse-order
