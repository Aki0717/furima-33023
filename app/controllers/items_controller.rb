class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index 

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
      
  end

  def destroy
      
  end


  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
