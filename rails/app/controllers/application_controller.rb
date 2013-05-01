class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= if session[:user_id]
      User.find_by_id session[:user_id]
    end
  end

  def logged_in?
    !!current_user
  end

  def require_not_logged_in
    if logged_in?
      redirect_to root_path
    end
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
