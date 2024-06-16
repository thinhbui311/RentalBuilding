class BuildingsController < ApplicationController
  before_action :retrieve_building, only: [:show]

  def index
    @buildings = Building.all.with_attached_images.includes(:addresses).page(params[:page]).per(10)
  end

  def show
    @apartments = @building.apartments.with_attached_images.page(params[:page]).per(6)
  end

  private

  def retrieve_building
    @building = Building.find(params[:id])
  end
end
