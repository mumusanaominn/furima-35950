class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @order_address = OrderAddress.new(order_params)
    redirect_to root_path if current_user.id == @item.user_id
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal, :area_id, :city, :house, :building, :tel).merge(user_id: current_user.id,
                                                                                                   item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    @item = Item.find(params[:item_id])

    redirect_to root_path if @item.order.present?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
