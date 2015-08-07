class DashboardController < ApplicationController
  def show
    @pictures = current_user.pictures
  end
end
