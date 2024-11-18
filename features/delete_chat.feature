Feature: Delete inappropriate chats

As a moderator I want to deleteinappropriate chats from users so that I can maintain a safe and respectful environment

Scenario: Moderator deletes an inappropriate chat message
  Given There is a moderator, Bob
  And I sign in as Bob
  And there is a chat message I find inappropriate
  When I choose to delete the chat message
  Then the chat message should no longer be visible in the chat