Feature: Delete inappropriate chats
  As a moderator
  I want to deleteinappropriate chats from users
  So that I can maintain a safe and respectful environment

  Scenario: Moderator deletes an inappropriate chat message
    Given I am logged in as a moderator
    And there is a chat message I find inappropriate
    When I choose to delete the chat message
    Then the chat message should no longer be visible in the chat
    And I should see a confirmation that the chat message was successfully deleted