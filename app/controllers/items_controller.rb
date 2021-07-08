class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(item_params)
    else
      render :new
    end
  end

  # def edit
  # @buy_item = BuyItem.find(params[:id])
  # redirect_to new_user_session_path unless current_user.id == @buy_item.user_id
  # end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :condition_id, :load_id, :area_id, :shipping_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
