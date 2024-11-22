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
  pending # Write code here that turns the phrase above into concrete actions
end

When('I submit the form') do
  pending # Write code here that turns the phrase above into concrete actions
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
  expect(page).to have_selector('input[name="post[Title]"]', visible: true)
  expect(page).to have_selector('input[name="post[Description]"]', visible: true)
  expect(page).to have_selector('input[name="post[Image]"]', visible: true)
  expect(page).to have_selector('input[name="post[Location]"]', visible: true)
  expect(page).to have_selector('input[name="post[TimeDate]"]', visible: true)

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

When('I click on Create post') do
    expect(page).to have_link('Create Post', href: '/posts/new')
    expect(page).to have_css('a.btn.btn-primary.btn-sm', text: 'Create Post')
end
