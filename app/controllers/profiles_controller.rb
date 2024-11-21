class ProfilesController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :show_saved_posts, :show_original_posts ]
  before_action :authorize_user, only: [ :edit, :update ]


  def show_original_posts
    @original_posts = @user.posts.order(created_at: :desc)
    respond_to do |format|
      format.json { render json: { posts: render_to_string(partial: "profiles/posts", locals: { posts: @original_posts, show_saved_posts: false }) } }
    end
  end

  def show_saved_posts
    if current_user == @user
      @saved_posts = current_user.saved_posts_associated.order(created_at: :desc)
      respond_to do |format|
        format.json { render json: { posts: render_to_string(partial: "profiles/posts", locals: { posts: @saved_posts, show_saved_posts: true }) } }
      end
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def update
    links = params[:user][:links].split("\n").map(&:strip).reject(&:blank?) if params[:user][:links]
    if @user.update(profile_params.merge(links: links))
      redirect_to profile_path(@user), notice: "Profile updated successfully."
    else
      flash[:alert] = "Failed to update profile."
      render :edit
    end
  end

  private

  def set_user
    if params[:id].blank?
      Rails.logger.debug("No ID provided in params")
      redirect_to root_path, alert: "User not found" and return
    end

    @user = User.find(params[:id])
    Rails.logger.debug("User found: #{@user.id}")
  rescue Mongoid::Errors::DocumentNotFound
    Rails.logger.debug("User not found with id=#{params[:id]}")
    redirect_to root_path, alert: "User not found"
  end

  def profile_params
    params.require(:user).permit(:name, :bio, :profile_picture, :profile_picture_url, links: [])
    params.require(:user).permit(:name, :bio, :profile_picture, :profile_picture_url, links: [])
  end
end
