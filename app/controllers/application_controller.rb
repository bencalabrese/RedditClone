class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def login_user!(user)
    login!(user)
    redirect_to :root
  end

  def logout_user!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
