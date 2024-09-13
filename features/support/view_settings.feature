Feature: View Settings

    As a logged-in user, I want to see settings to customize my experience

    Scenario: As a logged-in user, I want to see settings
        Given there are two users, Jack and Jill
        And I log in as Jill
        And I visit the homepage
        And I click "Settings" link
        Then I should see the settings page