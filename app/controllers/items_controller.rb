class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit]
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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      current_user.id == @item.user_id
      redirect_to item_path
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :condition_id, :load_id, :area_id, :shipping_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
