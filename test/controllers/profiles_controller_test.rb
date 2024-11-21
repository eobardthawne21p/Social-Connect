require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Test User", username: "testuser", password: "Password123@", password_confirmation: "Password123@", birthday: "2000-01-01")
  end

  test "should get show" do
    log_in(@user)


    get profile_url(@user)
    assert_response :success
  end
end
