require 'rails_helper'

RSpec.describe "Posts", type: :request do
  context "non-signed in user" do
    it "is redirected to the login page when accessing new post page" do
      get new_post_path

      expect(response).to redirect_to(login_path)
      expect(flash[:alert]).to match(/You must be logged in or sign up to access this page/)
    end

    it "is redirected to the log in page when accessing edit post page" do
      post = FactoryBot.create(:post)
      get edit_post_path(post)

      expect(response).to redirect_to(login_path)
      expect(flash[:alert]).to match(/You must be logged in or sign up to access this page/)
    end

    it "is redirected to the login page when attempting to create a post" do
      post posts_path, params: { post: { title: "MyPost", description: "MyDescription", image: "https://i.redd.it/i-got-bored-so-i-decided-to-draw-a-random-image-on-the-v0-4ig97vv85vjb1.png?width=1280&format=png&auto=webp&s=7177756d1f393b6e093596d06e1ba539f723264b", location: "Edinburg, TX", timeDate: "Time.new(2012, 12, 19, 1, 3, 25)" } }

      expect(response).to redirect_to(login_path)
      expect(flash[:alert]).to match(/You must be logged in or sign up to access this page/)
    end

    it "is redirected to the login page when attempting to delete a post" do
      post = FactoryBot.create(:post)
      delete post_path(post)

      expect(response).to redirect_to(login_path)
      expect(flash[:alert]).to match(/You must be logged in or sign up to access this page/)
    end
  end

  context "signed-in user" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user2)

    before do
      post login_path, params: { username: user.username, password: "Password@1" }
    end

    it "is redirected when trying to edit another user's post" do
      get edit_post_path(post)

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to match(/You are not authorized to edit this post/)
    end

    it "is redirected when trying to delete another user's post" do
      delete post_path(post)

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to match(/You are not authorized to delete this post/)
    end
  end
end
