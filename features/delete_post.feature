Feature: Deleting posts

As a user, I want to delete a post that I no longer want to display.

Scenario: As an Original Poster, I want to delete a post
    Given There is a user, Jack
    And I sign in as Jack
    And I have a post
    When I click on the "Delete" button for the post
    Then I should see a confirmation prompt
    And if I confirm, the post should be removed from the timeline
    And the post should no longer be visible to other users
    And I should see a confirmation that the post was successfully deleted