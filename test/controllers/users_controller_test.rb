require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
  end

  test "should get new" do
    get sign_up_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { birthday: @user.birthday, name: @user.name, password: "Password1@", password_confirmation: "Password1@", username: @user.username } }
    end

    assert_redirected_to root_path(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { birthday: @user.birthday, name: @user.name, password: "NewPass1@", password_confirmation: "NewPass1@", username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
