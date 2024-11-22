Feature: viewing saved posts

As a logged-in user, I want to see my saved posts when I click on the saved posts button in a new view so that my saved posts are readily available

Scenario: As a logged-in user, I want to see my saved posts when I click on 'saved posts' button
    Given There is a user, Jack
    And I sign in as Jack
    When I can view posts on the timeline
    And I click on 'Profile'
    And I click on the dropdown menu
    And I click on 'Saved Posts'
    Then I should see my saved posts displayed