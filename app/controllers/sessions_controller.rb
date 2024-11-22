class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.where(username: params[:username]).first

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to login_path
  end
end
