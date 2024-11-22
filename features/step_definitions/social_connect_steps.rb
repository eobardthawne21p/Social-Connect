Given('There is a user, Jack') do
  @jack = create(:user, name: 'Jack', username: 'jack', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01')
  @post = create(:post, title: "UEFA Champions League Final", description: "Manchester United face off against Real Madrid", image: "https://editorial.uefa.com/resources/028d-1ad79495f1c0-f00d4da4f16e-1000/badges.jpeg", location: "Dallas, TX", timeDate: "Wed Dec 19 2012 01:03:25 GMT-0500 (EST)", likes: 10, user: @jack, approved: true)
end

Given('I sign in as Jack') do
  visit login_path
  fill_in "Username", with: @jack.username
  fill_in "Password", with: 'Password123@'
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
  10.times do |i|
    create(
      :post,
      title: "Event #{i + 1}",
      timeDate: DateTime.now + i.days,
      description: "Description for Event #{i + 1}",
      location: "Location #{i + 1}",
      user: @jack,
      approved: true
    )
  end
  visit root_path
  post_titles = page.all('.post-card .card-title').map(&:text)
  expected_order = (1..10).to_a.reverse.map { |i| "Event #{i}" } + [ 'UEFA Champions League Final' ]
  expect(post_titles).to eq(expected_order)
end

Given('I am viewing a post') do
  visit root_path
  post_card = find('.post-card', text: @post.title)
  within(post_card) do
    click_link 'Read more'
  end
end

When('I enter a message in the comment section') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click {string}') do |string|
  click_on(string)
end

Then('my message should appear under the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('There is an admin, Juan') do
  @juan = create(:user, name: 'Juan', username: 'juan', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01', role: 'admin')
end

Given('there is a regular user, Jack') do
  @jack = create(:user, name: 'Jack', username: 'jack', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01', role: 'user')
end

Given('I sign in as Juan') do
  visit login_path
  fill_in "Username", with: @juan.username
  fill_in "Password", with: 'Password123@'
  click_on "Log In"
end

When('I navigate to the moderators management page') do
  click_on "Manage Moderators"
end

Then('I should see a control to add a new moderator next to Jack') do
  within('tr', text: 'Jack') do
    expect(page).to have_button("Add Moderator")
  end
end
When('I click the {string} button next to Jack') do |string|
  within('tr', text: 'Jack') do
    click_on string
  end
end

Then('I should see a confirmation that the moderator was successfully added') do
  expect(page).to have_content("Moderator was successfully added.")
end

Given('there is an existing moderator, Bob') do
  @bob = User.find_or_create_by(username: 'bob') do |user|
    user.name = 'Bob'
    user.password = 'Password123@'
    user.password_confirmation = 'Password123@'
    user.birthday = '1990-01-01'
    user.role = 'moderator'
  end
end

Then('I should see a control to remove a moderator next to Bob') do
  within('tr', text: 'Bob') do
    expect(page).to have_button("Remove Moderator")
  end
end

Then('when I click the {string} button to remove Bob') do |string|
  within('tr', text: 'Bob') do
    click_on string
  end
end

Then('I should see a confirmation that Bob was successfully removed') do
  expect(page).to have_content("Moderator was successfully removed.")
end

Given('There is a moderator, Bob') do
  @bob = create(:user, name: 'Bob', username: 'bob', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01', role: 'moderator')
end

Given('I sign in as Bob') do
  visit login_path
  fill_in "Username", with: @bob.username
  fill_in "Password", with: 'Password123@'
  click_on "Log In"
end

Given('there is a post pending approval') do
  @jack = create(:user, name: 'Jack', username: 'jack', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01')
  @post = create(:post, title: "UEFA Champions League Final", description: "Manchester United face off against Real Madrid", image: "https://editorial.uefa.com/resources/028d-1ad79495f1c0-f00d4da4f16e-1000/badges.jpeg", location: "Dallas, TX", timeDate: "Wed Dec 19 2012 01:03:25 GMT-0500 (EST)", likes: 10, user: @jack, approved: nil)
end

When('I choose to review the post') do
  visit moderator_dashboard_path
end

Then('I should see the content of the post') do
  expect(page).to have_content(@post.title)
  expect(page).to have_content(@post.description)
end

When('I approve the post') do
  click_on "Approve"
end

Then('the post should be published to the main feed') do
  visit root_path
  expect(page).to have_content(@post.title)
end

Then('I should see a confirmation that the post was successfully approved') do
  expect(page).to have_content("Post was successfully approved.")
end

Then('I should see a list of posts on the platform') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be able to scroll through and browse the posts') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I reject the post') do
  click_on "Reject"
end

Then('the post should not be published to the main feed') do
  visit root_path
  expect(page).to_not have_content(@post.title)
end

Then('I should see a confirmation that the post was successfully rejected') do
  expect(page).to have_content("Post was successfully rejected.")
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

Then('I should not see the post anymore') do
  expect(page).to_not have_content(@post.title)
end

Given('there is a post visible on the platform') do
  @jack = create(:user, name: 'Jack', username: 'jack', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01')
  @post = create(:post, title: "UEFA Champions League Final", description: "Manchester United face off against Real Madrid", image: "https://editorial.uefa.com/resources/028d-1ad79495f1c0-f00d4da4f16e-1000/badges.jpeg", location: "Dallas, TX", timeDate: "Wed Dec 19 2012 01:03:25 GMT-0500 (EST)", likes: 10, user: @jack, approved: true)
end

When('I choose to delete the post') do
  visit root_path
  click_on "Read more"
  click_on "Destroy this post"
end

Then('the post should no longer be visible on the platform') do
  expect(page).to_not have_content(@post.title)
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
  fill_in "Name", with: "My Name"
  fill_in "Biography", with: "I like to..."
  fill_in "Profile Picture URL", with: "data:image/jpeg;base64,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"
  fill_in "Links (one per line)", with: "www.Github.com"
end

When('I submit the form') do
  click_on "Save Changes"
end

Then('my profile should be updated') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click the heart icon to like the post') do
  click_on "Read more"
  find('.like-button').click
end

Then('the counter for likes should increase by {int}') do |int|
  find('.unlike-button').click
  initial_likes_count = find('#like-count').text.to_i
  find('.like-button').click
  new_likes_count = find('#like-count').text.to_i
  expect(new_likes_count).to eq(initial_likes_count + int)
end

When('I click the person icon to mark going on the post') do
  click_on "Read more"
  @initial_going_count = find('#going-count').text.to_i
  find('.going-button').click
  @new_going_count = find('#going-count').text.to_i
end

Then('the counter for going should increase by {int}') do |int|
  expect(@new_going_count).to eq(@initial_going_count + int)
end

When('I click the person icon to unmark going on the post') do
  click_on "Read more"
  find('.going-button').click
  find('.not_going-button').click
end

Then('the counter for going should decrease by {int}') do |int|
  find('.going-button').click
  initial_likes_count = find('#going-count').text.to_i
  find('.not_going-button').click
  new_likes_count = find('#going-count').text.to_i
  expect(new_likes_count).to eq(initial_likes_count - int)
end

When('I click the heart icon to unlike the post') do
  click_on "Read more"
  find('.like-button').click
  find('.unlike-button').click
end

Then('the counter for likes should decrease by {int}') do |int|
  find('.like-button').click
  initial_likes_count = find('#like-count').text.to_i
  find('.unlike-button').click
  new_likes_count = find('#like-count').text.to_i
  expect(new_likes_count).to eq(initial_likes_count - int)
end

When('I enter content into the post form') do
  fill_in "Title", with: @post.title
  fill_in "Description", with: @post.description
  fill_in "Image", with: @post.image
  fill_in "Location", with: @post.location
  fill_in "Timedate", with: @post.timeDate
end

Then('I should see the post appear on the timeline') do
  expect(page).to have_content(@post.title)
  expect(page).to have_content(@post.description)
  expect(page).to have_selector("img[src='#{@post.image}']")
end

When('I click the save post button') do
  visit root_path
  post_id = @post.id
  within("#bookmark_post_#{post_id}") do
    find('.save-button').click
  end
end

Then('the post will be added to my saved posts') do
  expect(@jack.saved_posts.where(post: @post).exists?).to be true
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
  expect(page).to have_selector('input[name="query"]', visible: true)
end

Given('There are posts with different categories') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('There is a user, Jill') do
  @jill = create(:user, name: 'Jill', username: 'jill', password: 'Password123@', password_confirmation: 'Password123@', birthday: '1990-01-01')
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

Then('I should see the posts I have created') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see my saved posts in a new window') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click on {string}') do |string|
  click_on string
end

Then('I should see the full details of the post') do
  expect(current_path).to eq(post_path(@post))
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

When('I view the timeline and can view posts on the timeline') do
  visit root_path
  expect(page).to have_css('.card-body.d-flex.flex-column')
end

Given('I can view posts on the timeline') do
  expect(page).to have_css('.card-body.d-flex.flex-column')
end

Then('I will see a pop-up with the option for the chatboard for the post') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I see a button {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see buttons for {string} and {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('there is a chat message on a post that I made that I want to delete') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click the unsave post button') do
  create(:saved_post, user: @jack, post: @post)
  visit root_path
  post_id = @post.id
  within("#bookmark_post_#{post_id}") do
    find('.unsave-button').click
  end
end

Then('the post will be removed from my saved posts') do
  expect(@jack.saved_posts.where(post: @post).exists?).to be false
end

When('I click the {string} button') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click on the dropdown menu') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see my saved posts displayed') do
  pending # Write code here that turns the phrase above into concrete actions
end
