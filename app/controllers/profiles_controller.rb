class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:edit, :update]

  def show
    
  end

  def edit
    
  end

  def update
    links = params[:user][:links].split("\n").map(&:strip).reject(&:blank?) if params[:user][:links]
    if @user.update(profile_params.merge(links: links))
      redirect_to profile_path(@user), notice: 'Profile updated successfully.'
    else
      flash[:alert] = 'Failed to update profile.'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue Mongoid::Errors::DocumentNotFound
    redirect_to root_path, alert: 'User not found'
  end

  def authorize_user
    redirect_to root_path, alert: "Not authorized" unless current_user == @user
  end

  def profile_params
    params.require(:user).permit(:name, :bio, :profile_picture, :profile_picture_url, links: []) 
  end
end
