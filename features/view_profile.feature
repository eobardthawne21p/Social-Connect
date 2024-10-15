Feature: View Profile

As a logged-in user, I should see my posts on my profile page

Scenario: As a logged-in user, I should see my posts
    Given There is a user, Jack
    And I sign in as Jack
    When I visit my profile page
    Then I should see the posts I have created