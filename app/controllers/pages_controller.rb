class PagesController < ApplicationController
  # Do not require login for the home page
  before_action :require_user, except: [ :home ]

  def home
    @posts = Post.where(approved: true).order(created_at: :desc) # Fetch posts for display on the homepage
  end
end
