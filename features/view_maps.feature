Feature: viewing maps on each post

As a logged-in user, I want to be able to see the option for maps in a new window so I can have safe directions

Scenario: As a logged-in user, I want to view maps in posts
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    And I select a post
    When I click the 'maps' button
    Then I should see maps to the event in a new window

