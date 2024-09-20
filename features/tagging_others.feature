Feature: Tagging Others

    As a logged-in User, I should be able to tag others in comments

    Scenario: As a logged-in user, I should be able to tag others
        Given There is a user, Jack
        And I login in as Jack
        And there is a user, Jill
        And I open the chatboard
        When I tag Jill in a commnet
        Then I should see that Jack is tagged in the comment