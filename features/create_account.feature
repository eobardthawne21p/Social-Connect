Feature: Create an Account

    As a logged-out user, I want to see the sign up page when I attempt to access the app
    So that I can create an account to use the app

    Scenario: As a logged-out user, I want to see the sign up page
        Given that I am a logged-out user
        When I visit the profile page
        Then I should be redirected to the sign up page
        