Feature: signing in

As a logged-in user, I want to see the login/sign-up page when I open the app and be granted access so that I can enjoy the app

Scenario: As a user, I want to be able to login
    Given There is a user, Jack
    And I see the login button
    When I sign in as Jack
    Then I can view posts on the timeline
