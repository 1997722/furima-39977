class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :state

  validates :product, :content, :price, :image, presence: true
  validates :category_id, :state_id, :postage_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1, message: '項目の選択が必要です' } 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message:'価格は¥300~¥9,999,999の間での設定が必要です' },
                  format: { with: /\A[0-9]+\z/,message: '半角数値での入力が必須です'}
end