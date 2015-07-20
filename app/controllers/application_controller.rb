class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :client

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def client
    @client = Instagram.client(access_token: current_user.token).user
  end
end
