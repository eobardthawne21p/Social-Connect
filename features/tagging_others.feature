Feature: Tagging Others

    As a logged-in User, I should be able to tag others in comments

    Scenario: As a logged-in user, I should be able to tag others
        Given there are two users, Jack and Jill
        And I login in as Jill
        And I open the chatboard
        When I tag Jack in a commnet
        Then I should see that Jack is tagged in the comment