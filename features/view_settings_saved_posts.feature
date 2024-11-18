Feature: see settings, profile, and saved posts options in the lower right-hand corner of the timeline

As a logged-in user, I want to see settings, profile, and saved posts buttons in the lower right-hand corner so that I have additional options besides the feed and search bar

Scenario: I am a logged-in user, and I should see the saved posts and profile options in the upper bar corner of the timeline page
    Given There is a user, Jack
    And I sign in as Jack
    When I view the timeline and can view posts on the timeline
    Then I should see buttons for 'saved posts' and 'profile'