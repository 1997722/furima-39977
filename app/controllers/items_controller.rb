class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:move_to_index]
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end
  
  def set_item
  @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image,:product, :price, :category_id, :content, :state_id, :postage_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end