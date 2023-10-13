FactoryBot.define do
  factory :user do
    family_name {'たけうち'}
    first_name {'あすか'}
    family_name_kana {'タケウチ'}
    first_name_kana {'アスカ'}
    email {Faker::Internet.email}
    password {'a00000'}
    password_confirmation {password}
    birthday {'2023-01-01'}
    nickname {'asuka'}
  end
end