Feature: Deleting posts

As a user, I want to delete a post that I no longer want to display.

Scenario: As an Original Poster, I want to delete a post
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    And I click on "Read more"
    When I click on "Destroy this post"
    Then I should not see the post anymore
