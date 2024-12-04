Feature: viewing chatboards on each post

As a logged-in user, I want to be able to see the chatboard of interested participants in a new view once I click the chat button so that I can interact with those people prior to the event

Scenario: As a logged-in user, I want to view the chatboard in posts
    Given There is a user, Jack
    And I sign in as Jack
    And I view the timeline
    And I am viewing a post
    And I click on 'Open Chat'
    Then I should see the chatboard in a pop up

