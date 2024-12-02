require 'rails_helper'

RSpec.describe User, type: :model do
  # User with valid data
  it "should accept a user with valid data" do
    user = FactoryBot.build(:user, name: "Tester", username: "tester123", password: "Tester123#", password_confirmation: "Tester123#", birthday: "2000-02-22")
    expect(user).to be_valid
  end

  # User with name empty
  it "should not accept a user with name empty" do
    user = FactoryBot.build(:user, name: "", username: "tester123", password: "Tester123#", password_confirmation: "Tester123#", birthday: "2000-02-22")
    expect(user).not_to be_valid
  end

  # User with username empty
  it "should not accept a user with username empty" do
    user = FactoryBot.build(:user, name: "Tester", username: "", password: "Tester123#", password_confirmation: "Tester123#", birthday: "2000-02-22")
    expect(user).not_to be_valid
  end

  # User with password empty
  it "should not accept a user with password empty" do
    user = FactoryBot.build(:user, name: "Tester", username: "tester123", password: "", password_confirmation: "Tester123#", birthday: "2000-02-22")
    expect(user).not_to be_valid
  end

  # User with password confirmation empty
  it "should not accept a user with password confirmation emtpy" do
    user = FactoryBot.build(:user, name: "Tester", username: "tester123", password: "Tester123#", password_confirmation: "", birthday: "2000-02-22")
    expect(user).not_to be_valid
  end

  # User with birthday empty
  it "should not accept a user with birthday empty" do
    user = FactoryBot.build(:user, name: "Tester", username: "tester123", password: "Tester123#", password_confirmation: "Tester123#", birthday: "")
    expect(user).not_to be_valid
  end

  # User with password and password_confirmation not matching
  it "should not accept a user with mismatched password confirmation" do
    user = FactoryBot.build(:user, name: "Tester", username: "tester123", password: "Tester123#", password_confirmation: "Tester123@", birthday: "2000-02-22")
    expect(user).not_to be_valid
  end

   # Profile picture URL format validation
   it "is not valid with an invalid profile picture URL" do
    user = FactoryBot.build(:user, profile_picture_url: 'invalid_url')
    expect(user).not_to be_valid
    expect(user.errors[:profile_picture_url]).to include("must be a valid URL")
  end

  # Bio length validation
  it "is not valid with a bio longer than 300 characters" do
    user = FactoryBot.build(:user, bio: 'a' * 301)
    expect(user).not_to be_valid
    expect(user.errors[:bio]).to include("is too long (maximum is 300 characters)")
  end

  # Link validation
  it "is not valid with an invalid link" do
    user = FactoryBot.build(:user, links: [ 'invalid_link' ])
    expect(user).not_to be_valid
    expect(user.errors[:links]).to include("invalid_link is not a valid URL")
  end
end
