Feature: see pop-up for maps and chatboards

As a logged-in user, I want to be able to see a map from my location to the event location in a new view once I click the maps button so that I can have safe directions to the location

Scenario: As a logged-in user, I should see a pop-up with the option for maps and chatboard for each post
Given There is a user, Jack
And I sign in as Jack
And I see a button 'maps/chat'
When I click the 'maps/chat' button
Then I will see a pop-up with options for both maps and the chatboard for the post