FactoryBot.define do
  factory :buy_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    ship_address { '東京都' }
    street_address { '1-1' }
    building { '東京ハイツ' }
    tel_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end
