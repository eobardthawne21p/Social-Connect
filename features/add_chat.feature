Feature: Sending messages on a post

As a user, I want to send messages on a post to interact with others.

Scenario: As an Original Poster, I want to send a message on a post
    Given There is a user, Jack
    And I sign in as Jack
    And I am viewing a post
    And I click 'Open Chat'
    When I enter a message in the comment section and click "Chat"
    Then my message should appear under the post