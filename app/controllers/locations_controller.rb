class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @locations_item_count = Item.group(:location).count
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
    @items_at_location = Item.where(location: @location)
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to locations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @location = Location.find(params[:id])
  end

  def update 
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path, status: :see_other
  end

  private
    def location_params
      params.require(:location).permit(:name, :quantity)
    end
end
