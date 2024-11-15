class Admin::UsersController < ApplicationController
  before_action :check_admin

  def manage_moderators
    @users = User.all
  end

  def add_moderator
    user = User.find_by(id: params[:user_id])
    if user.update_attribute(:role, "moderator")
      redirect_to admin_manage_moderators_path, notice: "Moderator was successfully added."
    else
      redirect_to admin_manage_moderators_path, alert: "Failed to update the user or user not found."
    end
  end

  def remove_moderator
    user = User.find_by(id: params[:id])
    if user.update_attribute(:role, "user")

      redirect_to admin_manage_moderators_path, notice: "Moderator was successfully removed."
    else
      redirect_to admin_manage_moderators_path, alert: "Failed to update the user or user not found."
    end
  end

  private

  def check_admin
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user&.admin?
  end
end
