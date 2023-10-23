require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address,user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'post_codeとprefecture_id、ship_address、street_address、tel_number、tokenがあれば購入できること' do
        expect(@buy_address).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと購入できないこと' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは『３桁ハイフン４桁』半角英数字でないと購入できないこと' do
        @buy_address.post_code = '１23-45678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと購入できないこと' do
        @buy_address.prefecture_id = 0
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'ship_addressが空だと購入できないこと' do
        @buy_address.ship_address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Ship address can't be blank")
      end
      it 'street_addressが空だと購入できないこと' do
        @buy_address.street_address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'tel_numberが空だと購入できないこと' do
        @buy_address.tel_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9桁以下だと購入できないこと' do
        @buy_address.tel_number = '090123456'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_numberが12桁以上だと購入できない' do
        @buy_address.tel_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_numberが半角数値でないと購入できないこと' do
        @buy_address.tel_number = '０9012341234'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel number is invalid")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
