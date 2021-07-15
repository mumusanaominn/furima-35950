FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    encrypted_password { password }
    nickname { Faker::Name.name }
    last_name { '山田' }
    first_name { '太郎' }
    kata_name { 'ヤマダ' }
    kana_name { 'タロウ' }
    birthday { Faker::Date.backward }
  end
end
