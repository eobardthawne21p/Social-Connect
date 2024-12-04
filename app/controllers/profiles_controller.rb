class ProfilesController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :show_saved_posts, :show_original_posts ]
  before_action :authorize_user, only: [ :edit, :update ]

  def update
    links = params[:user][:links].split("\n").map(&:strip).reject(&:blank?) if params[:user][:links]
    if password_params_present?
      if @user.authenticate(params[:user][:current_password])
        if params[:user][:password] == params[:user][:current_password]
          @user.errors.add(:password, "cannot be the same as your current password.")
        end
        if params[:user][:password] != params[:user][:password_confirmation]
          @user.errors.add(:password_confirmation, "does not match the new password.")
        end
      else
        @user.errors.add(:current_password, "is incorrect")
      end
      if @user.errors.any?
        flash.now[:alert] = "There were errors with your submission."
        render :edit and return
      end
    end
    update_params = profile_params.merge(links: links)
    if @user.update(update_params)
      redirect_to profile_path(@user), notice: "Profile updated successfully."
    else
      flash.now[:alert] = "Failed to update profile." + @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show_original_posts
    @posts = @user.posts.order(created_at: :desc)

    render partial: "profiles/original_posts", locals: { posts: @posts }, layout: false
  end

  def show_saved_posts
    @posts = current_user.saved_posts_associated.order(created_at: :desc)

    render partial: "profiles/saved_posts", locals: { posts: @posts }, layout: false
  end

  private

  def set_user
    @user = User.find(params[:id])
    Rails.logger.debug("User found: #{@user.id}")
  rescue Mongoid::Errors::DocumentNotFound
    Rails.logger.debug("User not found: #{params[:id]}")
    redirect_to root_path, alert: "User not found"
  end

  def authorize_user
    unless current_user == @user
      Rails.logger.debug("Authorization failed: current_user=#{current_user&.id}, @user=#{@user&.id}")
      redirect_to root_path, alert: "Not authorized"
    end
  end

  def profile_params
    params.require(:user).permit(:name, :bio, :profile_picture, :profile_picture_url, :password, :password_confirmation, links: [])
  end

  def password_params_present?
    params[:user][:password].present? && params[:user][:password_confirmation].present?
  end
end
