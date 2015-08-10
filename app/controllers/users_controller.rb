class UsersController < ApplicationController
  def show
    @pictures = current_user.pictures
  end

  def destroy
    redirect_to dashboard_path
  end

  def new
  end
end
