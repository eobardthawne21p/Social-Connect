Given('There is a user, Jack') do
  @jack = create(:user)
end

Given('I sign in as Jack') do
  visit login_path
    fill_in "Username", with: @jack.username
    fill_in "Password", with: @jack.password_digest
    click_on "Log In"
end

Given('I view the timeline') do
  visit posts_path
end


Then('I should see posts on the timeline') do
  @posts = Post.all
    @posts.each do |p|
        expect(post.body).to include(p.image)
    end
end

Then('I should see them in reverse chronological order') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I am viewing a post') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I enter a message in the comment section') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('my message should appear under the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('There is an admin, Juan') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I sign in as Juan') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I navigate to the moderators management page') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a control to add a new moderator') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('when I click the {string} button') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be able to add a new user as a moderator') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that the moderator was successfully added') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there is an existing moderator, Bob') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a control to remove a moderator') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('when I click the {string} button to remove Bob') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('Bob should be removed from their role') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that Bob was successfully removed') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('There is a moderator, Bob') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I sign in as Bob') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there is a post pending approval') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I choose to review the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the content of the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I approve the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the post should be published to the main feed') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that the post was successfully approved') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I can view posts on the timeline') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a list of posts on the platform') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be able to scroll through and browse the posts') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('that I am a logged-out user') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I attempt to visit any pages except for the sign up page') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be redirected to the sign up page') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I reject the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the post should not be published to the main feed') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that the post was successfully rejected') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there is a chat message I find inappropriate') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I choose to delete the chat message') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the chat message should no longer be visible in the chat') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that the chat message was successfully deleted') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I have a post') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click on the {string} button for the post') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation prompt') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('if I confirm, the post should be removed from the timeline') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the post should no longer be visible to other users') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that the post was successfully deleted') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there is a post visible on the platform') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I choose to delete the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the post should no longer be visible on the platform') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I navigate to the {string} section') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a list of users reported by moderators') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I select on Jack and click the {string} button') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('Jack should be deleted from the platform') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that Jack was successfully deleted') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I edit the details of the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('if I confirm, the post should be updated') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a confirmation that the post was successfully edited') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I visit my profile page') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I fill out the form') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I submit the form') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('my profile should be updated') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click the {string} button on an individual post') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the counter for likes should increase by {int}') do |int|
  # Then('the counter for likes should increase by {float}') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click on the {string} button') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I enter content into the post form') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the post appear on the timeline') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the post should be visible to other users') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there is a post that I find inappropriate') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I choose to report the post to moderators') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the post should be flagged for review by moderators') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the moderators should be able to see the report') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there is a user displaying inappropriate behavior') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I choose to report the user to admins') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the user should be flagged for review by admins') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I view a post') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click the {string} button') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the post will be added to my saved posts') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there are multiple posts with various keywords') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I use the search bar') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I enter a search query') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a list of posts matching my query') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the search bar') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('There are posts with different categories') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click on a filter option') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should only see posts that match the selected filter') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I can view posts on the timeline') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I sign in in as Jack') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('There is a user, Jill') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I open the chatboard') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I tag Jill in a commnet') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see that Jack is tagged in the comment') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I select a post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the chatboard in a new window') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see maps to the event in a new window') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I see a button {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I will see a pop-up with options for both maps and the chatboard for the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I visit my profile page') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the posts I have created') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see my saved posts in a new window') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I click {string} link') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the settings page') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see buttons for {string}, {string} and {string}') do |string, string2, string3|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click on a post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the full details of the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I log in as Jack') do
  pending # Write code here that turns the phrase above into concrete actions
end
