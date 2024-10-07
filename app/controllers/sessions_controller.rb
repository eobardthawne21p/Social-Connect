class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in successfully."
      redirect_to posts_path
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
