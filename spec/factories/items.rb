FactoryBot.define do
  factory :item do
    product {'商品名'}
    price { 500 }
    category_id {2}
    content {'商品内容'}
    state_id {2}
    postage_id {2}
    prefecture_id {2}
    shipping_date_id {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/S__355590150.jpg'), filename: 'S__355590150.jpg')
    end
  end
end