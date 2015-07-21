class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :client, :user, :current_path, :index_path
  # before_action :is_user_present?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def client
    unless session[:user_id]
      redirect_to root_path
    end
    @client = Instagram.client(access_token: current_user.token)
  end

  def user
    client.user
  end

  def index_path
    params[:controller] == "users"
  end

  def current_path
    params[:controller] == "dashboard"
  end

  # def is_user_present?
  #   redirect_to root_path unless current_user || params[:controller] == "welcome"
  # end
end
