class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  helper_method :current_user, :logged_in?
  def current_user
    # Assuming you're using sessions to store the user ID after login
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  # Add a helper method for redirecting unauthenticated users if needed
  def require_user
    unless logged_in?
      session[:return_to] = request.fullpath if request.get?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
