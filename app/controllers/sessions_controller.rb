class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    # Find the user by email (or username, depending on your setup)
    user = User.find_by(username: params[:username])

    # Authenticate the user using bcrypt's `authenticate` method
    if user && user.authenticate(params[:password])
      # Store the user ID in the session to log them in
      session[:user_id] = user.id
      redirect_to session.delete(:return_to) || root_path, notice: "Logged in successfully!"
    else
      # If the login fails, render the login form again with an error message
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    # Clear the user ID from the session to log out the user
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
