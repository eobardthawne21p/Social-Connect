require "test_helper"

class SavedPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_post = FactoryBot.create(:saved_post)
  end

  test "should get index" do
    get saved_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_post_url
    assert_response :success
  end

  test "should create saved_post" do
    assert_difference("SavedPost.count") do
      post saved_posts_url, params: { saved_post: { post_id: @saved_post.post_id, user_id: @saved_post.user_id } }
    end

    assert_redirected_to saved_post_url(SavedPost.last)
  end

  test "should show saved_post" do
    get saved_post_url(@saved_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_post_url(@saved_post)
    assert_response :success
  end

  test "should update saved_post" do
    patch saved_post_url(@saved_post), params: { saved_post: { post_id: @saved_post.post_id, user_id: @saved_post.user_id } }
    assert_redirected_to saved_post_url(@saved_post)
  end

  test "should destroy saved_post" do
    assert_difference("SavedPost.count", -1) do
      delete saved_post_url(@saved_post)
    end

    assert_redirected_to saved_posts_url
  end
end
