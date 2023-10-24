class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :non_buyed_item, only:[:index,:create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
        pay_item
        @buy_address.save
        redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
      
  private
  def buy_params
    params.require(:buy_address).permit(:price, :post_code, :prefecture_id, :ship_address, :street_address, :building, :tel_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: buy_params[:token],    
        currency: 'jpy'                 
      )
  end

  def non_buyed_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.buy.present?
  end
end