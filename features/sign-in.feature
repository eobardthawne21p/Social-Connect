Feature: signing in

As a logged-in user, I want to see the login/sign-up page when I open the app and be granted access so that I can enjoy the app

Scenario: As a user, I want to be able to login
    Given There is a user, Jack
    And I sign in as Jack
    When I view the timeline
    Then I should see posts on the timeline
