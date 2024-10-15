Feature: Viewing timeline

As a user, I should be able to see all posts on the timeline


Scenario: As an Original Poster, I want to see the timeline
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    Then I should see posts on the timeline
    And I should see them in reverse chronological order


Scenario: As a signed-in user, I want to see the timeline
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    Then I should see posts on the timeline
    And I should see them in reverse chronological order

