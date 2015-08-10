class PicturesController < ApplicationController
  before_action :set_picture
  
  def create
    current_user.pictures.create(picture_params)
    redirect_to dashboard_path
  end

  def destroy
    @picture.destroy
    # flash.notice = "Article '#{@article.title}' DELETED!!"
    redirect_to dashboard_path
  end

  private

  def picture_params
    params.permit(:image_url)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
