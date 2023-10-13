class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name,
  format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/,message: '全角（漢字・ひらがな・カタカナ）での入力が必須です'},
  presence: true
  validates :family_name,
  format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/,message: '全角（漢字・ひらがな・カタカナ）での入力が必須です'},
  presence: true
  validates :first_name_kana,
  format: { with: /\A([ァ-ヶー－]|ー)+\z/,message: 'は全角（カタカナ）での入力が必須です'},
  presence: true
  validates :family_name_kana,
  format: { with: /\A([ァ-ヶー－]|ー)+\z/,message: 'は全角（カタカナ）での入力が必須です'},
  presence: true
  validates :birthday,
  presence: true
  validates :password,
  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: 'は半角英数字混合での入力が必要です'},
  presence: true
end