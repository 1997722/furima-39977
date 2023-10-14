class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:product, :proce, :category_id, :content, :state_id, :postage_id, :prefecture_id, :shipping_date_id,:user)
end
