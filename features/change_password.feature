Feature: Change Password

As a user, I want to be able to change my password

Given There is a user, Jack
And I sign in as Jack
When I visit my profile page
And I click "Edit"
And I click "Change password"
And I change my password
Then my password should be changed