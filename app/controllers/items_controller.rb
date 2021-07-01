class ItemsController < ApplicationController

  def index
    
  end

  def new
    @item = item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit()

  end
end
