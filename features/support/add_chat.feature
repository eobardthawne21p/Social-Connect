Feature: Sending messages on a post
As a user, I want to send messages on a post to interact with others.

Scenario: As an Original Poster, I want to send a message on a post
Given I am viewing a post
When I enter a message in the comment section
And I click "Send"
Then my message should appear under the post