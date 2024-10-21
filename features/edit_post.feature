Feature: Editing posts

As a user, I want to edit a post so that the information is accurate

Scenario: As an Original Poster, I want to edit a post
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    And I click on "Read more"
    When I click on "Edit this post"
    And I edit the details of the post
    And I click on "Update Post"
    Then I should see the updated post