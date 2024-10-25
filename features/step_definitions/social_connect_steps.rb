Given('There is a user, Jack') do
  @jack = create(:user, name: 'Jack', username: 'jack', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01')
  @post = create(:post, title: "UEFA Champions League Final", description: "Manchester United face off against Real Madrid", image: "https://editorial.uefa.com/resources/028d-1ad79495f1c0-f00d4da4f16e-1000/badges.jpeg", location: "Dallas, TX", timeDate: "Wed Dec 19 2012 01:03:25 GMT-0500 (EST)", likes: "10")
end

Given('I sign in as Jack') do
  visit login_path
  fill_in "Username", with: @jack.username
  fill_in "Password", with: 'password123'
  click_on "Log In"
end

Given('I view the timeline') do
  visit root_path
end


Then('I should see posts on the timeline') do
  @posts = Post.all
    @posts.each do |p|
      expect(page).to have_selector("img[src='#{p.image}']")
      expect(page).to have_content(p.title)
      expect(page).to have_content(p.description)
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

Then('I should not see the post anymore') do
  expect(page).to_not have_content(@post)
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
  fill_in "Title", with: "UEFA Europa League Final"
end

Then('I should see the updated post') do
  expect(page).to have_content("UEFA Europa League Final")
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

When('I enter content into the post form') do
  fill_in "Title", with: @post.title
  fill_in "Description", with: @post.description
  fill_in "Image", with: @post.image
  fill_in "Location", with: @post.location
  fill_in "Likes", with: @post.likes
  fill_in "Timedate", with: @post.timeDate
end

Then('I should see the post appear on the timeline') do
  expect(page).to have_content(@post.title)
  expect(page).to have_content(@post.description)
  expect(page).to have_selector("img[src='#{@post.image}']")
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

When('I click on {string}') do |string|
  click_on string
end

Then('I should see the full details of the post') do
  expect(current_path).to eq(post_path(@post))
end

Given('I log in as Jack') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I am not logged in') do
  visit sign_up_path
end

When('I attempt to visit a restricted page like \/posts') do
  visit posts_path
end

Then('I should be redirected to the sign-up page') do
  expect(current_path). to eq(sign_up_path)
end

Then('I should be redirected to the login page') do
  expect(current_path). to eq(login_path)
end

Then('I should be able to access the page without redirection') do
  expect(current_path). to eq(posts_path)
end
