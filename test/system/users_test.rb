require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = FactoryBot.create(:user)
  end

  test "should create user" do
    visit root_path
    click_on "Sign Up"

    fill_in "Name", with: @user.name
    fill_in "Username", with: @user.username
    fill_in "Password", with: "Password@1"
    fill_in "Password confirmation", with: "Password@1"
    fill_in "Birthday", with: @user.birthday
    click_on "Sign Up", match: :first
  end

  # test "should update User" do
  # visit user_url(@user)
  # click_on "Edit this user", match: :first

  # fill_in "Birthday", with: @user.birthday
  # fill_in "Name", with: @user.name
  # fill_in "Password", with: "NewPass1@"
  # fill_in "Password confirmation", with: "NewPass1@"
  # fill_in "Username", with: @user.username
  # click_on "", match: :first

  # assert_selector ".notice", text: "Account was successfully updated"
  # end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "Account was successfully destroyed"
  end
end
