class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :path_to_dashboard,
                :path_to_user,
                :path_to_root,
                :client,
                :user
  # before_action :is_user_present?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def path_to_user
    params[:controller] == "users"
  end

  def path_to_dashboard
    params[:controller] == "dashboard"
  end

  def path_to_root
    params[:controller] == "welcome"
  end

  def client
    @instagram_client ||= Instagram.client(access_token: current_user.token)
  end

  def user
    client.user
  end

  # def is_user_present?
  #   redirect_to root_path unless current_user || params[:controller] == "welcome"
  # end
end
