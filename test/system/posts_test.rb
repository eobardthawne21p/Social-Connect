require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
  end

  def log_in_as(user)
    visit login_url
    fill_in "Username", with: user.username
    fill_in "Password", with: "Password@1"
    click_on "Log In"
  end

  test "should create post" do
    log_in_as(@user)
    click_on "Create post"

    fill_in "Description", with: @post.description
    fill_in "Image", with: @post.image
    fill_in "Location", with: @post.location
    fill_in "Time", with: @post.timeDate
    fill_in "Title", with: @post.title
    fill_in "Likes", with: @post.likes
    click_on "Create Post"

    assert_text "Post was successfully created"
  end

  test "should update Post" do
    log_in_as(@user)
    click_on "Read more"
    click_on "Edit this post", match: :first

    fill_in "Description", with: @post.description
    fill_in "Image", with: @post.image
    fill_in "Location", with: @post.location
    fill_in "Time", with: @post.timeDate.strftime("%Y-%m-%d %H:%M:%S")
    fill_in "Title", with: @post.title
    fill_in "Likes", with: @post.likes
    click_on "Update Post"

    assert_text "Post was successfully updated"
  end

  test "should destroy Post" do
    log_in_as(@user)
    click_on "Read more"
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
