class LocalitiesController < ApplicationController
  before_action :set_locality, only: [:show, :edit, :update, :destroy]

  def index
    @localities = Locality.all
  end

  def show
  end

  def new
    @locality = Locality.new
  end

  def edit
  end

  def create
    @locality = Locality.new(locality_params)

    if @locality.save
      redirect_to @locality, notice: "Locality was successfully created."
    else
      render :new
    end
  end

  def update
    if @locality.update(locality_params)
      redirect_to @locality, notice: "Locality was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @locality.destroy
    redirect_to localities_url, notice: "Locality was successfully destroyed."
  end

  private
  def set_locality
    @locality = Locality.find(params[:id])
  end

  def locality_params
    params.require(:locality).permit(:name, :abbreviation, :slug, :region_id, :country_id)
  end
end
