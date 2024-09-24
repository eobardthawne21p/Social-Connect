Feature: Create an Account

As a logged-out user, I want to see the sign up page when I attempt to access the app so that I can create an account to use the app

Scenario: As a logged-out user, I want to see the sign up page
    Given that I am a logged-out user
    When I attempt to visit any pages except for the sign up page
    Then I should be redirected to the sign up page
        