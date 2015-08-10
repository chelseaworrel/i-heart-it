class DashboardController < ApplicationController
  def show
    @pictures = current_user.pictures
  end

  def destroy
    redirect_to dashboard_path
  end
end
