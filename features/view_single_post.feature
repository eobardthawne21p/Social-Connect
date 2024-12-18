Feature: Viewing a single post

As a user, I want to view a single post to see its details.

Scenario: As an Original Poster, I want to view one post
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    When I click on "Read more"
    Then I should see the full details of the post