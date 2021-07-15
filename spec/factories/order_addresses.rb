FactoryBot.define do
  factory :order_address do
    postal { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    house { '1-1' }
    building { '東京ハイツ' }
    tel { '12345678999' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
