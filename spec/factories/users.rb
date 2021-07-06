FactoryBot.define do
  factory :user do
    email { 'test@example' }
    password { '000000aaaa' }
    encrypted_password { '000000aaaa' }
    nickname { 'susunoki' }
    last_name { '山田' }
    first_name { '太郎' }
    kata_name { 'ヤマダ' }
    kana_name { 'タロウ' }
    birthday { '2000-01-22' }
  end
end
