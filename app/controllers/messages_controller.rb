class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    @item = Item.find(params[:item_id])
    @message = Message.new(cat: params[:message][:cat], item_id: params[:item_id], user_id: current_user.id)

    # @message = Message.create(message_params)
    # redirect_to "/items/#{@message.item.id}"

    if @message.save
      ActionCable.server.broadcast 'message_channel', { content: @message, user_id: current_user.nickname }
    else
      redirect_to root_path

    end
  end

  def destroy
    @message = Message.find(params[:id])
    @item = Item.find(params[:item_id])
    message = @item.messages.find(params[:id])
    if current_user.id == message.user.id
      message.destroy
      redirect_back(fallback_location: root_path)
    else
      render 'items/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:cat).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
