class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @locations = Location.all
    @item = Item.new
  end

  def create
    @locations = Location.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @item = Item.find(params[:id])
    @locations = Location.all
  end

  def update 
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def item_params
      @direct_params = params.require(:item).permit(:name, :quantity, :location)
      @location = Location.find(@direct_params[:location])
      @direct_params[:location] = @location
      return @direct_params
    end
end
