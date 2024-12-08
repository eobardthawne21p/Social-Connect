Feature: Access Control for Unauthenticated Users
  As a new or unauthenticated user,
  I want to be redirected to the sign-up or login page
  when I try to access restricted pages,
  so that I can register or log in before accessing the app.

  Scenario: Redirect new users to sign-up when accessing restricted pages
    Given I am not logged in
    When I attempt to visit a restricted page like /posts
    Then I should be redirected to the sign-up page

  Scenario: Redirect unauthenticated users to login when accessing restricted pages
    Given There is a user, Jack
    And I am not logged in
    When I attempt to visit a restricted page like /posts
    Then I should be redirected to the login page
