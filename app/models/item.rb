class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :state
  belongs_to :user 
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :content
    validates :image
    validates :product
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
  end
  validates :price, numericality: true
end
