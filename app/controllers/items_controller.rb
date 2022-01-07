class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(name: "...", quantity: "...")

    if @item.save
      redirect_to 
    else
      render :new, status: :unprocessable_entity
    end
  end
end
