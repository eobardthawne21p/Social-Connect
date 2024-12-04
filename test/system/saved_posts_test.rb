require "application_system_test_case"

class SavedPostsTest < ApplicationSystemTestCase
  setup do
    @user = FactoryBot.create(:user)
    @saved_post = FactoryBot.create(:saved_post, user: @user)
  end

  # def log_in_as(user)
  #   visit login_url
  #   fill_in "Username", with: user.username
  #   fill_in "Password", with: "Password@1"
  #   click_on "Log In"
  # end

  # test "visiting the index" do
  #   log_in_as(@user)
  #   visit saved_posts_url
  #   assert_selector "h1", text: "Saved posts"
  # end

  # test "should create saved post" do
  #   log_in_as(@user)
  #   visit saved_posts_url
  #   click_on "New saved post"
  #
  #   fill_in "Post", with: @saved_post.post_id
  #   fill_in "User", with: @saved_post.user_id
  #   click_on "Create Saved post"
  #
  #   assert_text "Saved post was successfully created"
  #   click_on "Back"
  # end

  # test "should update Saved post" do
  #   log_in_as(@user)
  #   visit saved_post_url(@saved_post)
  #   click_on "Edit this saved post", match: :first
  #
  #   fill_in "Post", with: @saved_post.post_id
  #   fill_in "User", with: @saved_post.user_id
  #   click_on "Update Saved post"
  #
  #   assert_text "Saved post was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Saved post" do
  #   log_in_as(@user)
  #   visit saved_post_url(@saved_post)
  #   click_on "Destroy this saved post", match: :first
  #
  #   assert_text "Saved post was successfully destroyed"
  # end
end
