require 'rails_helper'

# frozen_string_literal: true

RSpec.describe "Users", type: :request do
  context "signing up" do
    it "signing up successfully" do
      post sign_up_path, params: { user: {
        name: "New User",
        username: "NewUsername",
        password: "Password@1",
        password_confirmation: "Password@1",
        birthday: "2024-10-28"
        } }

      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to match(/Account was successfully created!/)
    end

    it "does not sign up successfully without a name" do
      post sign_up_path, params: { user: {
        name: "",
        username: "NewUsername",
        password: "Password@1",
        password_confirmation: "Password@1",
        birthday: "2024-10-28"
      } }

      expect(response).to have_http_status(422)
      expect(flash[:alert]).to match(/Name can't be blank/)
    end

    it "does not sign up successfully without a username" do
      post sign_up_path, params: { user: {
        name: "New User",
        username: "",
        password: "Password@1",
        password_confirmation: "Password@1",
        birthday: "2024-10-28"
      } }

      expect(response).to have_http_status(422)
      expect(flash[:alert]).to match(/Username can't be blank/)
    end

    it "does not sign up successfully when password confirmation does not match" do
      post sign_up_path, params: { user: {
        name: "New User",
        username: "NewUsername",
        password: "Password@1",
        password_confirmation: "Password@11",
        birthday: "2024-10-28"
      } }

      expect(response).to have_http_status(422)
      expect(flash[:alert]).to match(/Password confirmation doesn't match Password/)
    end
    
    it "does not sign up successfully without a password" do
      post sign_up_path, params: { user: {
        name: "New User",
        username: "NewUsername",
        password: "",
        password_confirmation: "",
        birthday: "2024-10-28"
      } }

      expect(response).to have_http_status(422)
      expect(flash[:alert]).to match(/Password can't be blank/)
    end

    it "does not sign up successfully without a birthday" do
      post sign_up_path, params: { user: {
        name: "New User",
        username: "NewUsername",
        password: "Password@1",
        password_confirmation: "Password@1",
        birthday: ""
      } }

      expect(response).to have_http_status(422)
      expect(flash[:alert]).to match(/Birthday can't be blank/)
    end
  end

  context "logging in" do
    it "logging in successfully" do
      user = FactoryBot.create(:user)

      post login_path, params: {
        username: user.username,
        password: "Password@1"
      }

      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to match(/Logged in successfully/)
    end

    it "logging in unsuccessfully" do
      user = FactoryBot.create(:user)

      post login_path, params: {
        username: user.username,
        password: "Password1#"
      }

      expect(response).to have_http_status(200)
      expect(flash[:alert]).to match(/Invalid username or password/)
    end
  end

  context "logging out" do
    it "logging out successfully" do
      user = FactoryBot.create(:user)
      post login_path, params: {
        username: user.username,
        password: "Password@1"
      }
      delete logout_path

      expect(response).to redirect_to(login_path)
      expect(flash[:notice]).to match(/Logged out successfully/)
    end
  end
end
