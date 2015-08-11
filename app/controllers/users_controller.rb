class UsersController < ApplicationController
  def show
    @pictures = current_user.pictures
  end

  def destroy
    redirect_to user_path
  end
end
