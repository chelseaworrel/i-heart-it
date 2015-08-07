class PicturesController < ApplicationController
  def create
    current_user.pictures.create(picture_params)
    redirect_to dashboard_path
  end

  private
  def picture_params
    params.permit(:image_url)
  end
end
