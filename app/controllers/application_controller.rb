class ApplicationController < ActionController::Base
  helper_method :current_user, :authenticated?

  before_action :check_authentication

  def check_authentication
    unless current_user
      cookies[:destination_path] = request.path
      redirect_to login_path
    end
  end

  def authenticated?
    !!current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
