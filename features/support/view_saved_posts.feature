Feature: viewing saved posts

As a logged-in user, I want to see my saved posts when I click on the saved posts button in a new view so that my saved posts are readily available

Scenario: As a logged-in user, I want to see my saved posts when I click on 'saved posts' button
    Given There is a user, Jack
    And I sign in as Jack
    And I am viewing the timeline
    When I click the 'saved posts' button
    Then I should see my saved posts in a new window