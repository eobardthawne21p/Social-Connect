Feature: Browse main feed
  As a moderator
  I want to see the main feed
  So that I can monitor posts and user activity

  Scenario: Moderator views and browses the main feed
    Given I am logged in as a moderator
    When I navigate to the main feed
    Then I should see a list of posts on the platform
    And I should be able to scroll through and browse the posts