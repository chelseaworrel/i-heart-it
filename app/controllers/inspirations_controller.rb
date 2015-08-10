class InspirationsController < ApplicationController
  def show
    @category = Inspiration.find_by(name: params[:id])
  end

  def index
    @categories = Inspiration.all
  end
end
