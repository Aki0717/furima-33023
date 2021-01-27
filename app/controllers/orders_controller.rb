class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  @item = Item.find(params[:item_id])
  unless @item.id == @item.order.item_id
    unless @item.user.id == current_user.id
      @order_address = OrderAddress.new
    else
      redirect_to root_path(current_user)
    end
  else
    redirect_to root_path
  end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
