Feature: Sign-Out

    As a logged-out user, I want the app to be hidden from me
    so that the app's security is maintained

    Scenario: As a logged-out user, I want the app to be hidden from me
        Given there are two users, Jack and Jill
        And I log in as Jill
        And I sign out as Jill
        When I try to visit a restricted page
        Then I should be redirected to the login page
