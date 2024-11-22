Feature: see pop-up for maps and chatboards

As a logged-in user, I want to be able to see a button for a popup for chatboard

Scenario: As a logged-in user, I should see a pop-up with for the chatboard for each post
Given There is a user, Jack
And I sign in as Jack
And I see a button 'chat'
When I click the 'chat' button
Then I will see a pop-up with the option for the chatboard for the post