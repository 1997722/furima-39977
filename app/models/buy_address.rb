class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:post_code, :tel_number, :prefecture_id, :ship_address, :street_address, :building, :token
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tel_number, format: { with: /\A\d{10,11}\z/ }
    validates :ship_address
    validates :street_address
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :token
  end
  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, tel_number: tel_number, prefecture_id: prefecture_id, ship_address: ship_address, street_address: street_address, building: building, buy_id: buy.id)
  end
  
end
