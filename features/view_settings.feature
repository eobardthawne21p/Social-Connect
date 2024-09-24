Feature: View Settings

    As a logged-in user, I want to see settings to customize my experience

    Scenario: As a logged-in user, I want to see settings
        Given There is a user, Jack
        And I log in as Jack
        And I can view posts on the timeline
        And I click "Settings" link
        Then I should see the settings page