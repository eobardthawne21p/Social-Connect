class DashboardController < ApplicationController
  before_action :require_login
  before_action :check_moderator_access

  def moderator
    @posts_to_review = Post.where(approved: nil)  # Fetch posts that haven't been approved yet
  end

  private

  def check_moderator_access
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user.moderator? || current_user.admin?
  end
end
