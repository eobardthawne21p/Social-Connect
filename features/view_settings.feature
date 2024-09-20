Feature: View Settings

    As a logged-in user, I want to see settings to customize my experience

    Scenario: As a logged-in user, I want to see settings
        Given There is a user, Jack
        And I log in as Jack
        When I visit the homepage
        And I click "Settings" link
        Then I should see the settings page