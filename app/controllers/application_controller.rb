class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  helper_method :current_user, :logged_in?

  # Fetch the currently logged-in user based on session[:user_id]
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Check if a user is logged in
  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in or sign up to access this page."

      if Rails.env.test?
        redirect_to login_path
      else
        redirect_to User.exists? ? login_path : sign_up_path
      end
    end
  end
end
