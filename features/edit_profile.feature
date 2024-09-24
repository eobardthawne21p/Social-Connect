Feature: Edit Profile

As a logged-in user I should be able to edit my Profile

Scenario: As a logged-in user, I want to edit my Profile
    Given There is a user, Jack
    And I login in as Jack
    And I visit my profile page
    When I click "Edit"
    And I fill out the form
    And I submit the form
    Then my profile should be updated