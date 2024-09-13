Feature: signing in

As a logged-in user, I want to see the login/sign-up page when I open the app and be granted access so that I can enjoy the app

Scenario: As a user, I want to be able to login
    Given There is a user, Jack
    And I see the login button
    And I sign in as Jack
    When I login
    Then I am able to see the timeline
