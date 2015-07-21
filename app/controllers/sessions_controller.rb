class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(oauth)
    if @user
      session[:user_id] = @user.id
      redirect_to users_path #figure out where you actually want this to go
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

private

  def oauth
    request.env['omniauth.auth']
  end

end
