require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    context '商品出品できるとき' do
      it "productとprice、category_id、content、image、state_id、postage_id、prefecture_id、shipping_date_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it 'priceが300円なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9,999,999円なら出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it 'priceが半角なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'productがないと出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'priceないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'category_idがないと出品できない' do
        @item.category_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'contentがないと出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'state_idがないと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it 'postage_idがないと出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end
      it 'prefecture_idがないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'shipping_date_idがないと出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it 'ユーザー情報がない場合は登録できない' do
        @item = FactoryBot.build(:item, user: nil) 
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end 
  end
end