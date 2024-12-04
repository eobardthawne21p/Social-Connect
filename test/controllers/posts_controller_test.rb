require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    log_in(@user)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { description: @post.description, image: @post.image, location: @post.location, timeDate: @post.timeDate, title: @post.title, likes: @post.likes } }
    end

    assert_redirected_to root_path(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { description: @post.description, image: @post.image, location: @post.location, timeDate: @post.timeDate, title: @post.title, likes: @post.likes } }
    assert_redirected_to root_path(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)

      assert_redirected_to root_path
    end
  end
end
