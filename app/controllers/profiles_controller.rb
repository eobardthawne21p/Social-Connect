class ProfilesController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :show_saved_posts, :show_original_posts ]
  before_action :authorize_user, only: [ :edit, :update ]

  def update
    links = params[:user][:links].split("\n").map(&:strip).reject(&:blank?) if params[:user][:links]
    if @user.update(profile_params.merge(links: links))
      redirect_to profile_path(@user), notice: "Profile updated successfully."
    else
      flash[:alert] = "Failed to update profile."
      render :edit
    end
  end

  def show_original_posts
    @posts = @user.posts.order(created_at: :desc)

    render partial: 'profiles/original_posts', locals: { posts: @posts }, layout: false
  end

  def show_saved_posts
    @posts = current_user.saved_posts_associated.order(created_at: :desc)

    render partial: 'profiles/saved_posts', locals: { posts: @posts }, layout: false
  end

  private

  def set_user
    @user = User.find(params[:id])
    Rails.logger.debug("User found: #{@user.id}")
  rescue Mongoid::Errors::DocumentNotFound
    Rails.logger.debug("User not found: #{params[:id]}")
    redirect_to root_path, alert: 'User not found'
  end

  def authorize_user
    unless current_user == @user
      Rails.logger.debug("Authorization failed: current_user=#{current_user&.id}, @user=#{@user&.id}")
      redirect_to root_path, alert: "Not authorized"
    end
  end

  def profile_params
    params.require(:user).permit(:name, :bio, :profile_picture, :profile_picture_url, links: [])
  end
end
