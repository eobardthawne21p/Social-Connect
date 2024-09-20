Feature: Editing posts

As a user, I want to edit a post so that the information is accurate

Scenario: As an Original Poster, I want to edit a post
    Given There is a user, Jack
    And I sign in as Jack
    And I have a post
    When I click on the "Edit" button for the post
    And I edit the details of the post
    Then I should see a confirmation prompt
    And if I confirm, the post should be updated
    And I should see a confirmation that the post was successfully edited