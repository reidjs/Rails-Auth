class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  def require_logged_out
    if logged_in?
      # p "error"
      redirect_to cats_url
    end
  end

  def require_logged_in
    if !logged_in?
      redirect_to new_sessions_url
    end
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
  def logged_in?
    !!current_user
  end

  # How does the current user have access to this class method.
  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def login_user!(user_name, password)

  end

end
