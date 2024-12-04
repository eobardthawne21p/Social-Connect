Feature: Delete inappropriate chats

As a moderator I want to deleteinappropriate chats from users so that I can maintain a safe and respectful environment

Scenario: Moderator deletes an inappropriate chat message
  Given There is a moderator, Bob
  And I sign in as Bob
  And There is a user, Jack
  And I am viewing a post
  And I click on 'Open Chat' 
  And there is a chat message I find inappropriate
  When I choose to delete the chat message
  Then the chat message should no longer be visible in the chat

Scenario: User deletes their own chat message
  Given There is a user, Jack
  And I sign in as Jack
  And I am viewing a post
  And I click 'Open Chat'
  And there is a chat message on a post that I made that I want to delete
  When I choose to delete the chat message
  Then the chat message should no longer be visible in the chat

Scenario: Admin deletes a chat message
  Given There is an admin, Juan
  And I sign in as Juan
  And There is a user, Jack
  And I am viewing a post
  And I click 'Open Chat'
  And there is a chat message I find inappropriate
  When I choose to delete the chat message
  Then the chat message should no longer be visible in the chat