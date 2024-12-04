require 'rails_helper'

RSpec.describe Post, type: :model do
  # Post with valid data
  it "should accept a post with valid data" do
    post = FactoryBot.build(:post, title: "Election Day", description: "Today is the day to vote from 7am to 7pm", image: "https://media.istockphoto.com/id/172965977/photo/election-day-badge-in-red-white-blue.jpg?s=612x612&w=0&k=20&c=F5ErtYhSlf5P2-Y-XoUmLgvYezsAiRm_ikiGJSbH1hg=", location: "Edinburg, TX", timeDate: Time.new(2024, 11, 5, 7, 0, 0))
    expect(post).to be_valid
  end

  # Post with empty title
  it "should not accept a post with empty title" do
    post = FactoryBot.build(:post, title: "", description: "Today is the day to vote from 7am to 7pm", image: "https://media.istockphoto.com/id/172965977/photo/election-day-badge-in-red-white-blue.jpg?s=612x612&w=0&k=20&c=F5ErtYhSlf5P2-Y-XoUmLgvYezsAiRm_ikiGJSbH1hg=", location: "Edinburg, TX", timeDate: Time.new(2024, 11, 5, 7, 0, 0))
    expect(post).not_to be_valid
  end

  # Post with empty description
  it "should not accept a post with empty description" do
    post = FactoryBot.build(:post, title: "Election Day", description: "", image: "https://media.istockphoto.com/id/172965977/photo/election-day-badge-in-red-white-blue.jpg?s=612x612&w=0&k=20&c=F5ErtYhSlf5P2-Y-XoUmLgvYezsAiRm_ikiGJSbH1hg=", location: "Edinburg, TX", timeDate: Time.new(2024, 11, 5, 7, 0, 0))
    expect(post).not_to be_valid
  end

  # Post with empty image
  it "should not accept a post with empty image" do
    post = FactoryBot.build(:post, title: "Election Day", description: "Today is the day to vote from 7am to 7pm", image: "", location: "Edinburg, TX", timeDate: Time.new(2024, 11, 5, 7, 0, 0))
    expect(post).not_to be_valid
  end

  # Post with empty location
  it "should not accept a post with empty location" do
    post = FactoryBot.build(:post, title: "Election Day", description: "Today is the day to vote from 7am to 7pm", image: "https://media.istockphoto.com/id/172965977/photo/election-day-badge-in-red-white-blue.jpg?s=612x612&w=0&k=20&c=F5ErtYhSlf5P2-Y-XoUmLgvYezsAiRm_ikiGJSbH1hg=", location: "", timeDate: Time.new(2024, 11, 5, 7, 0, 0))
    expect(post).not_to be_valid
  end

  # Post with empty time
  it "should not accept a post with empty time" do
    post = FactoryBot.build(:post, title: "Election Day", description: "Today is the day to vote from 7am to 7pm", image: "https://media.istockphoto.com/id/172965977/photo/election-day-badge-in-red-white-blue.jpg?s=612x612&w=0&k=20&c=F5ErtYhSlf5P2-Y-XoUmLgvYezsAiRm_ikiGJSbH1hg=", location: "Edinburg, TX", timeDate: "")
    expect(post).not_to be_valid
  end

  # Association Tests
  it "belongs to a user" do
    post = FactoryBot.create(:post)
    expect(post.user).to be_a(User)
  end

  it "increases likes by 1" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user, likes: 0)
    expect { post.increment_likes! }.to change { post.reload.likes }.by(1)
  end

  it "decreases likes by 1" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user, likes: 1)
    expect { post.decrement_likes! }.to change { post.reload.likes }.by(-1)
  end

  it "saving a post" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)
    saved_post = user.saved_posts.create(post: post)

    expect(user.saved_posts).to include(saved_post)
    expect(saved_post.post).to eq(post)

    if post.respond_to?(:saved_users)
      expect(post.saved_users).to include(user)
    end
  end

  it "unsaving a post" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)
    saved_post = user.saved_posts.create(post: post)

    expect { saved_post.destroy }.to change(user.saved_posts, :count).by(-1)

    user.reload
    expect(user.saved_posts).not_to include(saved_post)
  end
end
