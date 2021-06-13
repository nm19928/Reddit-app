class ApplicationController < ActionController::Base

  helper_method :current_user

  def login!(user)
    @user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    current_user ||= User.find_by(session_token:session[:session_token])
  end

  def logout
    current_user.restart_token
    session[:session_token] = nil
  end

  def require_current_user
    if current_user.nil?
      redirect_to sessions_url
    end
  end

  def require_moderator(mod)
    return true if mod == current_user.username
  end

end
