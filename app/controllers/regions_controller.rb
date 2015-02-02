class RegionsController < ApplicationController
  before_action :set_region, only: [:edit, :update, :destroy]

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find_by(slug: params[:id])
  end

  def new
    @region = Region.new
  end

  def edit
  end

  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to @region, notice: "Region was successfully created."
    else
      render :new
    end
  end

  def update
    if @region.update(region_params)
      redirect_to @region, notice: "Region was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @region.destroy
    redirect_to regions_url, notice: "Region was successfully destroyed."
  end

  private
  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name, :abbreviation, :country_id)
  end
end
