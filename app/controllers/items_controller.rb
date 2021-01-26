class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :baria_user, only: [:edit, :update]
  before_action :find_params, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # def destroy
      
  # end


  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def baria_user
    unless Item.find(params[:id]).user.id.to_i == current_user.id
      redirect_to root_path(current_user)
    end
  end

  def find_params
    @item = Item.find(params[:id])
  end
end
