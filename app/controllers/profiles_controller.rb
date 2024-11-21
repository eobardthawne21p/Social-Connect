class ProfilesController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update ]
  before_action :authorize_user, only: [ :edit, :update ]

  def show
  end

  def edit
  end

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

  private

  def set_user
    @user = User.find(params[:id])
  rescue Mongoid::Errors::DocumentNotFound
    redirect_to root_path, alert: "User not found"
  end

  def authorize_user
    redirect_to root_path, alert: "Not authorized" unless current_user == @user
  end

  def profile_params
    params.require(:user).permit(:name, :bio, :profile_picture, :profile_picture_url, :password, :password_confirmation, links: [])
  end

  def password_params_present?
    params[:user][:password].present? && params[:user][:password_confirmation].present?
  end
end
